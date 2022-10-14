from django.test import TestCase
from django.urls import reverse


class TestIndex(TestCase):
    def test_index_title(self):
        response = self.client.get(reverse("index"))
        assert response.status_code == 200
        self.assertEqual(True, b"<title>Holiday Homes</title>" in response.content)
