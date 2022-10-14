from django.test import TestCase
from django.urls import reverse


class TestProfiles(TestCase):
    def test_profiles_title(self):
        response = self.client.get(reverse("profiles_index"))
        assert response.status_code == 200
        self.assertEqual(True, b"<title>Profiles</title>" in response.content)
