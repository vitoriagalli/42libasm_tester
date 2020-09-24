/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_strlen.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vscabell <vscabell@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/09/20 19:49:31 by vscabell          #+#    #+#             */
/*   Updated: 2020/09/24 02:20:43 by vscabell         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "header_test.h"

void	result(size_t (*ft)(), char *str)
{
	printf("%s\n", str);
	printf("%lu\n", ft(str));
}

int		main(int argc, char **argv)
{
	if (argv[1][0] == '0')
		result(strlen, argv[2]);
	else if (argv[1][0] == '1')
		result(ft_strlen, argv[2]);
	return (0);
}
