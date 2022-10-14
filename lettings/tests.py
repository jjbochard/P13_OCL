from django.test import TestCase
from django.urls import reverse


class TestLettings(TestCase):
    def test_lettings_title(self):
        response = self.client.get(reverse("lettings_index"))
        assert response.status_code == 200
        self.assertEqual(True, b"<title>Lettings</title>" in response.content)
