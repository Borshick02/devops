import pytest
from main import add, subtract


def test_add():
    assert add(5, 3) == 8
    assert add(-1, 1) == 0
    assert add(0, 0) == 0
    assert add(-5, -3) == -8
    assert add(100, 200) == 300
    assert add(1, -1) == 0
    assert add(10**6, 10**6) == 2 * 10**6
    assert add(3.5, 2.5) == 6.0


def test_subtract():
    assert subtract(5, 3) == 2
    assert subtract(-1, 1) == -2
    assert subtract(0, 0) == 0
    assert subtract(-5, -3) == -2
    assert subtract(100, 200) == -100
