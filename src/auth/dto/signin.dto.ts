import { IsString } from 'class-validator';

export class SignInDto {
  @IsString()
  pseudo: string;

  @IsString()
  password: string;
}
