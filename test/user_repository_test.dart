import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_app/user_model.dart';
import 'package:flutter_test_app/user_repository.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class MockHTTPClient extends Mock implements Client {}

void main() {
  late UserRepository userRepository;
  late MockHTTPClient mockHttpClient;

  setUp(
    () {
      mockHttpClient = MockHTTPClient();
      userRepository = UserRepository(mockHttpClient);
    },
  );
  group(
    "UserRepository",
    () {
      group(
        "getUser function",
        () {
          test(
            "given UserRepository class when getUser func is called and status code is 200 then a user model should be returned",
            () async {
              // Arrange
              when(
                () => mockHttpClient.get(
                  Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
                ),
              ).thenAnswer((invocation) async {
                return Response(
                  '''
                    {
                      "id": 1,
                      "name": "Leanne Graham",
                      "username": "Bret",
                      "email": "Sincere@april.biz",
                      "website": "hildegard.org"
                    
                    }
                  ''',
                  200,
                );
              });
              // Act
              final user = await userRepository.getUser();
              // Assert
              expect(user, isA<User>());
            },
          );

          test(
            "given UserRepository class when getUser func is called and status code is not 200 then an exception should be thrown",
            () async {
              // Arrange
              when(() => mockHttpClient.get(
                    Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
                  )).thenAnswer((invocation) async {
                return Response('{}', 500);
              });
              // Act
              final user = userRepository.getUser();
              // Assert
              expect(user, throwsException);
            },
          );
        },
      );
    },
  );
}
