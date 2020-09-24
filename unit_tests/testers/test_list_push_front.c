/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_list_push_front.c                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vscabell <vscabell@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/09/23 17:19:54 by vscabell          #+#    #+#             */
/*   Updated: 2020/09/24 02:43:12 by vscabell         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "header_test.h"

int	main(int argc, char **argv)
{
	int		index;
	t_list	*list;

	index = atoi(argv[1]);
	initialize_list(&list, index, ft_list_push_front);
	ft_print_list(list);
	ft_list_clear(list, ft_free);
	return (0);
}
