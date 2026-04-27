import { ConflictException, Injectable } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { User } from './entities/user.entity';
import { Repository } from 'typeorm';
import * as bcrypt from 'bcrypt';

@Injectable()
export class UsersService {
  constructor(@InjectRepository(User) private repo: Repository<User>) {}

  async getAllUsers(): Promise<User[]> {
    return this.repo.find();
  }

  async getUserById(id: number): Promise<User | null> {
    return this.repo.findOne({ where: { id } });
  }

  async create(userData: CreateUserDto): Promise<User> {
    const existing = await this.repo.findOne({ where: { email: userData.email } });
    if (existing) {
      throw new ConflictException('Email already in use');
    }
    const hash = await bcrypt.hash(userData.password, 10);
    const user = this.repo.create({ ...userData, password: hash });
    return this.repo.save(user);
  }

  async findOne(pseudo: string): Promise<User | null> {
    return this.repo.findOneBy({ pseudo });
  }
}
