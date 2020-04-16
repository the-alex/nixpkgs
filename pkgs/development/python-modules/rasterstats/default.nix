{ buildPythonPackage
, affine
, numpy
, rasterio
, shapely
, cligj
, fiona
, coverage
, pytest
, pytestcov
, simplejson
, pyshp
, fetchFromGitHub
, stdenv
}:

buildPythonPackage rec {
  pname = "rasterstats";
  version = "0.14.0";

  src = fetchFromGitHub {
    owner = "perrygeo";
    repo = "python-rasterstats";
    rev = "853a0c33b4a9c4c5e6f04620c9e07429a8e7151e";
    sha256 = "0xzqcfi6zwbzihi2s5lplpvgr7qb6zl6l1r67nh9f221dw600xqs";
  };

  propagatedBuildInputs = [
    affine
    numpy
    rasterio
    shapely
    simplejson
    cligj
    fiona
  ];

  checkInputs = [
    coverage
    pytest
    pytestcov
    simplejson
    pyshp
  ];

  checkPhase = ''
    py.test --cov rasterstats --cov-report term-missing
  '';

  meta = with stdenv.lib; {
    description = "Summary statistics of geospatial raster datasets based on vector geometries.";
    license = licenses.bsd3;
    homepage = "https://github.com/perrygeo/python-rasterstats";
    maintainers = with maintainers; [ glittershark the-alex ];
  };
}
