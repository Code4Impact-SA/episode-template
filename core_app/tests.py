from django.test import TestCase
from django.contrib.auth import get_user_model

User = get_user_model()

class CustomUserModelTest(TestCase):
    def test_create_user_with_custom_fields(self):
        print("\nRunning: test_create_user_with_custom_fields")
        user = User.objects.create_user(
            username='testuser',
            password='securepassword123',
            email='test@example.com',
            bio='This is a test bio',
            phone_number='1234567890'
        )
        print("User created:", user.username)

        self.assertEqual(user.username, 'testuser')
        self.assertTrue(user.check_password('securepassword123'))
        self.assertEqual(user.email, 'test@example.com')
        self.assertEqual(user.bio, 'This is a test bio')
        self.assertEqual(user.phone_number, '1234567890')

    def test_str_method(self):
        print("\nRunning: test_str_method")
        user = User.objects.create_user(username='john_doe', password='pass')
        result = str(user)
        print("String representation:", result)

        self.assertEqual(result, 'john_doe')
