import { Controller, Get, UseGuards } from '@nestjs/common';
import { AuthGuard } from './auth/auth.guard';

@Controller()
export class AppController {
  @Get('/private')
  @UseGuards(AuthGuard)
  private(): string {
    return 'Hello 🧐!!';
  }

  @Get('/open')
  open(): string {
    return 'Hello 👋!!';
  }
}
