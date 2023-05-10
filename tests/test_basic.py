import nano_min
import numpy as np


def test_basic_add_args():
    assert nano_min.add(1, 2) == 3


def test_basic_add_kwargs():
    assert nano_min.add(a=1, b=2) == 3


def test_get_floats_from_range():
    res = nano_min.get_floats_in_range(start=0, end=10)
    assert isinstance(res, list)
    assert len(res) == 10
    assert res[0] == 0.0
    assert res[-1] == 9.0
    assert isinstance(res[0], float)


def test_get_numpy_data():
    res = nano_min.get_numpy_data()

    assert isinstance(res, np.ndarray)
    assert res.shape == (2, 4)


def test_get_mesh_class():
    res = nano_min.get_mesh()
    assert isinstance(res, nano_min.Mesh)
    assert hasattr(res, "positions")
    assert hasattr(res, "indices")
