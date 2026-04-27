import { Injectable } from '@nestjs/common';
import { Player } from './entities/players.entities';
import { TableDto } from 'src/tables/dto/tables.dto';

@Injectable()
export class PlayersService {
  placeBet(player: Player, bet: number, table: TableDto): void {
    if (player.chips < bet) {
      throw new Error('Insufficient chips to place bet');
    }
    player.chips -= bet;
    player.currentBet += bet;
    table.pot += bet;
  }

  fold(player: Player): void {
    player.hasFolded = true;
    player.hasPlayed = true;
  }

  check(player: Player, table: TableDto): void {
    if (player.currentBet !== table.currentBet) {
      throw new Error('Cannot check: bet does not match current table bet');
    }
    player.hasPlayed = true;
  }

  call(player: Player, table: TableDto): void {
    if (player.currentBet === table.currentBet) {
      throw new Error('Cannot call: bet already matches current table bet');
    }
    const callAmount = table.currentBet - player.currentBet;
    if (callAmount <= 0) {
      throw new Error('Cannot call: player bet exceeds current table bet');
    }
    this.placeBet(player, callAmount, table);
    player.hasPlayed = true;
  }

  raise(player: Player, raise: number, table: TableDto): number {
    this.placeBet(player, raise, table);
    player.hasPlayed = true;
    table.currentBet = player.currentBet;
    return table.currentBet;
  }

  allIn(player: Player, table: TableDto): boolean {
    if (player.chips <= 0) {
      throw new Error('No chips remaining for all-in');
    }
    this.placeBet(player, player.chips, table);
    player.hasPlayed = true;
    return (player.isAllIn = true);
  }

  showCards(player: Player): any {
    return player.hand;
  }
}
