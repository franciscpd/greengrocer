String authErrorsString(String? error) {
  print(error);
  switch (error) {
    case 'Invalid credentials':
      return 'Email e/ou senha inválidos';
    case 'Invalid session token':
      return 'Token inválido';
    case 'Account already exists for this username.':
      return 'Email já cadastrado';
    case 'A duplicate value for a field with unique values was provided':
      return 'CPF já cadastrado';
    case 'CPF is not valid':
      return 'CPF inválido';
    default:
      return 'Um erro indefinido ocorreu';
  }
}
