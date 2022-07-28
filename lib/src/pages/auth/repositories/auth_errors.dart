String authErrorsString(String? error) {
  switch (error) {
    case 'Invalid credentials':
      return 'Email e/ou senha inválidos';
    case 'Invalid session token':
      return 'Token inválido';
    default:
      return 'Um erro indefinido ocorreu';
  }
}
