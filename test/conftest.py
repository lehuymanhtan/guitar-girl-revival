import sys, os, json, base64, bz2, urllib.parse
import pytest
from thrift.transport import TTransport
from thrift.protocol import TBinaryProtocol

# Add thrift_gen/ to sys.path so compiled modules are importable
sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "thrift_gen"))

FIXTURES = os.path.join(os.path.dirname(__file__), "fixtures", "captures.json")

@pytest.fixture(scope="session")
def captures():
    with open(FIXTURES) as f:
        return json.load(f)

def raw_thrift_bytes(b64_urlencoded: str) -> bytes:
    unquoted = urllib.parse.unquote(b64_urlencoded)
    unquoted += "=" * (-len(unquoted) % 4)
    return bz2.decompress(base64.b64decode(unquoted))

def roundtrip(raw: bytes, struct_cls) -> bytes:
    transport = TTransport.TMemoryBuffer(raw)
    proto = TBinaryProtocol.TBinaryProtocol(transport)
    obj = struct_cls()
    obj.read(proto)
    buf = TTransport.TMemoryBuffer()
    proto_out = TBinaryProtocol.TBinaryProtocol(buf)
    obj.write(proto_out)
    return buf.getvalue()
