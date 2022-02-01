/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client_bonus.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ielmakhf <ielmakhf@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/01/31 14:14:37 by ielmakhf          #+#    #+#             */
/*   Updated: 2022/01/31 18:05:14 by ielmakhf         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk_bonus.h"

void	send_byte_char(int pid, char c)
{
	int	i;

	i = 7;
	while (i >= 0)
	{
		if (c >> i & 1)
			kill(pid, SIGUSR2);
		else
			kill(pid, SIGUSR1);
		usleep(200);
			i--;
	}
}

void	send_char(int pid, char *str)
{
	int	i;

	i = -1;
	while (str[++i])
	{
		send_byte_char(pid, str[i]);
	}
	send_byte_char(pid, str[i]);
}

void	handler2(int sig)
{
	(void)sig;
	ft_putstr("Its okeeey");
	exit(0);
}

void	ft_msg_error(void)
{
	ft_putstr("Usage ----> ./client [server-pid] [message]\n");
	exit(0);
}

int	main(int ac, char **av)
{
	if (ac != 3)
		ft_msg_error();
	signal(SIGUSR2, handler2);
	send_char(ft_atoi(av[1]), av[2]);
	while (1)
		sleep(1);
}
