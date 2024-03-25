# Package url

https://github.com/apple/swift-openapi-generator
https://github.com/apple/swift-openapi-runtime
https://github.com/apple/swift-openapi-urlsession

# https://github.com/apple/swift-openapi-generator

- 이 패키지는 빌드시에만 사용하는 것이다.
- Target는 모두 none으로 해준다.
- Build Phases > Run Build Tool Plug-ins에 OpenAPIGenerator를 추가한다.

# https://github.com/apple/swift-openapi-runtime / https://github.com/apple/swift-openapi-urlsession

이 패키지들은 app에서 사용하는 것이므로 target을 지정해주어야 한다.
