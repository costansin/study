import sys
import os
import math

import pytest

import hw3


mandatory = pytest.mark.mandatory
extra = pytest.mark.extra


@mandatory
def test_noimport():
    """Test that you import nothing"""
    with open(hw3.__file__, 'r') as f:
        assert "import" not in "".join(f.readlines())


def test_doc_non_empty():
    assert hw3.bisect.__doc__
    assert len(hw3.bisect.__doc__) > 10


a = (1, 3, 3, 4, 5, 6, 7)


@mandatory
def test_generic():
    assert hw3.bisect(a, 3.5, 0, 4) == 3
    assert hw3.bisect(a, 4.5, 0, 5) == 4


@mandatory
def test_exact_match():
    assert hw3.bisect(a, 4, 0, 5) == 4


@mandatory
def test_exact_multiple():
    assert hw3.bisect(a, 3, 0, 5) == 3


@extra
def test_lo_negative():
    with pytest.raises(ValueError):
        hw3.bisect(a, 0, -1)


def test_below_min():
    assert hw3.bisect(a, 2, 3, 5) == 3
    assert hw3.bisect(a, -5, 0, 4) == 0


def test_above_max():
    assert hw3.bisect(a, 100, 0, 4) == 4


def test_default_top():
    assert hw3.bisect(a, 100, 0) == len(a)


def test_default_all():
    assert hw3.bisect(a, 4) == 4


class CountingComparable:
    ops = 0

    def __init__(self, value):
        self._v = value

    def __le__(self, other):
        type(self).ops += 1
        return self._v.__le__(other._v)

    def __lt__(self, other):
        type(self).ops += 1
        return self._v.__lt__(other._v)

    def __ge__(self, other):
        type(self).ops += 1
        return self._v.__ge__(other._v)

    def __gt__(self, other):
        type(self).ops += 1
        return self._v.__gt__(other._v)


b = tuple(map(CountingComparable, a))


@mandatory
def test_comparisons_only():
    CountingComparable.ops = 0
    assert hw3.bisect(b, CountingComparable(1.5), 0, 3) == 1


@pytest.mark.parametrize('delta', (extra(0), extra(1), 2, 3))
@pytest.mark.parametrize('N', (10000, 2 ** 16, 2 ** 10 - 1, 2 ** 15 + 1))
def test_num_comparisons(N, delta):
    CountingComparable.ops = 0
    c = tuple(CountingComparable(i) for i in range(N))
    optimal = N.bit_length()
    if 2 ** (optimal - 1) == N:
        optimal -= 1
    assert hw3.bisect(c, CountingComparable(N // 2)) == N // 2 + 1
    assert CountingComparable.ops <= optimal + delta


def recurse(*args, **kwargs):
    assert False, "Your function is recursive"


@pytest.yield_fixture
def rec_wrapped():
    f = hw3.bisect
    hw3.bisect = recurse
    yield f
    hw3.bisect = f


def test_no_recursion(rec_wrapped):
    N = 10 ** 5
    c = tuple(range(N))
    assert rec_wrapped(c, 100, 0, len(c)) == 101


@mandatory
def test_returns_int():
    assert type(hw3.bisect(a, 1)) is int
