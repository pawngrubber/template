import unittest


# Make sure the unittest module even loads
class TestStringMethods(unittest.TestCase):
    def test_upper(self):
        self.assertEqual("foo".upper(), "FOO")


if __name__ == "__main__":
    unittest.main()
