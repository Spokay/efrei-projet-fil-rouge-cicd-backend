import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ConfigModule } from '@nestjs/config';
import { User } from './users/entities/user.entity';
import { UsersModule } from './users/users.module';
import { AuthModule } from './auth/auth.module';
import { TablesModule } from './tables/tables.module';
import { ActionsModule } from './actions/actions.module';
import { DecksModule } from './decks/decks.module';
import { GameLogicModule } from './game-logic/games-logic.module';
import { PlayersModule } from './players/players.module';

@Module({
  imports: [
    ConfigModule.forRoot({ isGlobal: true }),
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: process.env.DB_HOST ?? 'localhost',
      port: parseInt(process.env.DB_PORT ?? '5432'),
      username: process.env.DB_USER ?? 'postgres',
      password: process.env.DB_PASSWORD,
      database: process.env.DB_NAME ?? 'poker',
      entities: [User],
      synchronize: process.env.NODE_ENV !== 'production',
      ssl: process.env.DB_HOST?.includes('azure.com')
        ? { rejectUnauthorized: false }
        : false,
    }),
    UsersModule,
    AuthModule,
    TablesModule,
    ActionsModule,
    DecksModule,
    GameLogicModule,
    PlayersModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
