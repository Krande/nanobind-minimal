import my_ext


def test_basic_add_args():
    assert my_ext.add(1, 2) == 3


def test_basic_add_kwargs():
    assert my_ext.add(a=1, b=2) == 3
