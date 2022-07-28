String authErrorsString(String? error) {
  switch (error) {
    case 'Invalid credentials':
      return 'Email e/ou senha inválidos';
    default:
      return 'Um erro indefinido ocorreu';
  }
}
