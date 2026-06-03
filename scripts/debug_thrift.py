import sys, os, json, base64, bz2, urllib.parse
sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "thrift_gen"))

from thrift.transport import TTransport
from thrift.protocol import TBinaryProtocol
from tapsonic.main_getGameDataList_en.ttypes import getGameDataListReturn

FIXTURES = os.path.join(os.path.dirname(__file__), "..", "test", "fixtures", "captures.json")

def raw_thrift_bytes(b64_urlencoded: str) -> bytes:
    unquoted = urllib.parse.unquote(b64_urlencoded)
    unquoted += "=" * (-len(unquoted) % 4)
    return bz2.decompress(base64.b64decode(unquoted))

# Hook readFieldBegin
original_readFieldBegin = TBinaryProtocol.TBinaryProtocol.readFieldBegin

skipped_fids = []

def hooked_readFieldBegin(self):
    fname, ftype, fid = original_readFieldBegin(self)
    if ftype != 0: # 0 is STOP
        # We don't know if it will be skipped yet, but let's record it
        pass
    return fname, ftype, fid

original_skip = TBinaryProtocol.TBinaryProtocol.skip

def hooked_skip(self, type):
    # If skip is called, we just read a field that we didn't understand!
    # Let's inspect the call stack
    import inspect
    frame = inspect.currentframe().f_back
    fid = frame.f_locals.get('fid', 'unknown')
    struct_name = frame.f_locals.get('self', 'unknown').__class__.__name__
    print(f"SKIPPING: struct={struct_name}, field_id={fid}, type={type}")
    original_skip(self, type)

TBinaryProtocol.TBinaryProtocol.readFieldBegin = hooked_readFieldBegin
TBinaryProtocol.TBinaryProtocol.skip = hooked_skip

def debug():
    with open(FIXTURES) as f:
        captures = json.load(f)
    
    raw = raw_thrift_bytes(captures["/main/getGameDataList/en/"]["res_b64"])
    
    transport = TTransport.TMemoryBuffer(raw)
    proto = TBinaryProtocol.TBinaryProtocol(transport)
    
    obj = getGameDataListReturn()
    obj.read(proto)
    print("Done reading")

if __name__ == "__main__":
    debug()
