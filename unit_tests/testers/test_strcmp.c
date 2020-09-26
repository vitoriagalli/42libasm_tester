/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_strcmp.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vscabell <vscabell@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/09/20 19:49:31 by vscabell          #+#    #+#             */
/*   Updated: 2020/09/26 19:18:04 by vscabell         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "header_test.h"

static void	result(int (*ft)(), char *s1, char *s2)
{
	printf("s1 = \"%s\" | ", s1);
	printf("s2 = \"%s\"\n", s2);
	printf("return = %d\n\n", ft(s1, s2));
}

static void	test(int (*ft)(), char *str)
{
	result(ft, str, "");
	result(ft, str, "Hello 42!");
	result(ft, str, "\n\n\f\r\t");
	result(ft, str, "lorem teste");
	result(ft, str, "   teste");
}

int			main(int argc, char **argv)
{
	int		funct;
	char	*input;

	funct = atoi(argv[1]);
	input = argv[2];
	(void)argc;
	if (funct == ORIG)
		test(strcmp, input);
	else if (funct == IMPLEM)
		test(ft_strcmp, input);
	return (0);
}
