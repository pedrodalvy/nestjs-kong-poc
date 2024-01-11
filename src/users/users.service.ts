import { Injectable } from '@nestjs/common';
import { UserInterface } from './user.interface';

@Injectable()
export class UsersService {
  private readonly users: UserInterface[] = [
    {
      id: 1,
      username: 'guess',
      password: 'guess',
    },
  ];

  async findOne(username: string): Promise<UserInterface> {
    return this.users.find((user) => user.username === username);
  }
}
