/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_strcmp.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vscabell <vscabell@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/09/20 19:49:31 by vscabell          #+#    #+#             */
/*   Updated: 2020/09/21 22:06:30 by vscabell         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "header_test.h"

void	result(int (*ft)(), char *s1, char *s2)
{
	printf("%s\n", s1);
	printf("%s\n", s2);
	printf("%d\n", ft(s1, s2));
}

void	test(int (*ft)(), char *str)
{
	result(ft, str, "");
	result(ft, str, "Hello 42!");
	result(ft, str, "\n\n\f\r\t");
	result(ft, str, "lorem teste");
	result(ft, str, "   teste");
}

int		main(int argc, char **argv)
{
	if (argv[1][0] == ORIG)
		test(&strcmp, argv[2]);
	else if (argv[1][0] == IMPLEM)
		test(&ft_strcmp, argv[2]);
}
