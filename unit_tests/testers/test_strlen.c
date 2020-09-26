/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_strlen.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vscabell <vscabell@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/09/20 19:49:31 by vscabell          #+#    #+#             */
/*   Updated: 2020/09/26 19:12:40 by vscabell         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "header_test.h"

static void	result(size_t (*ft)(), char *str)
{
	printf("string = %s\n", str);
	printf("return = %lu\n", ft(str));
}

int			main(int argc, char **argv)
{
	int		funct;
	char	*input;

	funct = atoi(argv[1]);
	input = argv[2];
	(void)argc;
	if (funct == ORIG)
		result(strlen, input);
	else if (funct == IMPLEM)
		result(ft_strlen, input);
	return (0);
}
