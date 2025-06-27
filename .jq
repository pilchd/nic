def conv__inHg_hPa: . * 33.8638895326;
def conv__hPa_inHg: . / 33.8638895326;

def fcol:
    (transpose | map(map(length) | max)) as $col
  | map(to_entries | map("\(.value)\(($col[.key] - (.value | length)) * " ")"));

def fprec($sf): tostring | match("\\d+\\.\\d{\($sf)}").string;

def offset: now | localtime | mktime - now | trunc;

def wrap($lhs): "\($lhs)\(.)\($lhs)";
def wrap($lhs; $rhs): "\($lhs)\(.)\($rhs)";
