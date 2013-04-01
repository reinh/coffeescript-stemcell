ok = (val) -> expect(val).toBeTruthy()

Hello = @Hello

describe 'Hello', ->
  it 'says hello', ->
    ok new Hello('World').greet() is 'Hello, World!'
