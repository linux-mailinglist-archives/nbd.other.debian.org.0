Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DCE2191CE
	for <lists+nbd@lfdr.de>; Wed,  8 Jul 2020 22:48:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B7B9B20336; Wed,  8 Jul 2020 20:48:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jul  8 20:48:09 2020
Old-Return-Path: <ebiggers@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 586CF20274
	for <lists-other-nbd@bendel.debian.org>; Wed,  8 Jul 2020 20:32:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.181 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id lBVW2IyvqahG for <lists-other-nbd@bendel.debian.org>;
	Wed,  8 Jul 2020 20:32:10 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id CB1EF2025D
	for <nbd@other.debian.org>; Wed,  8 Jul 2020 20:32:09 +0000 (UTC)
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net [107.3.166.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E36BC20720;
	Wed,  8 Jul 2020 20:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594240326;
	bh=Phr+m9logqBbeGjOMUdUtNLbZiR9Q8OLEMn3mWsvao8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qhUtPzDPYysvTjVFW40ey+9VkdAW+90/1lX07VNQuDb78Itivr4ZHuD275dXwOn3G
	 mjFs3V/IUr6W+IeM2I2eq9sAABwc7wOdgftlw5Z7FMpAuJ0n4TOCGBWYPXXr9HOy7F
	 bZwnwfQtdxk6h5um4Jel7s91n9ksWc0qNt/vduSA=
Date: Wed, 8 Jul 2020 13:32:04 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Zheng Bin <zhengbin13@huawei.com>
Cc: mchristi@redhat.com, josef@toxicpanda.com, axboe@kernel.dk,
	navid.emamdoost@gmail.com, linux-block@vger.kernel.org,
	nbd@other.debian.org, linux-kernel@vger.kernel.org,
	yi.zhang@huawei.com
Subject: Re: [PATCH v4] nbd: Fix memory leak in nbd_add_socket
Message-ID: <20200708203204.GB35321@sol.localdomain>
References: <20200629012349.26641-1-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200629012349.26641-1-zhengbin13@huawei.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <9uM0NPmAssH.A.phB.JEjBfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/915
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200708203204.GB35321@sol.localdomain
Resent-Date: Wed,  8 Jul 2020 20:48:09 +0000 (UTC)

On Mon, Jun 29, 2020 at 09:23:49AM +0800, Zheng Bin wrote:
> When adding first socket to nbd, if nsock's allocation failed, the data
> structure member "config->socks" was reallocated, but the data structure
> member "config->num_connections" was not updated. A memory leak will occur
> then because the function "nbd_config_put" will free "config->socks" only
> when "config->num_connections" is not zero.
> 
> Fixes: 03bf73c315ed ("nbd: prevent memory leak")
> Reported-by: syzbot+934037347002901b8d2a@syzkaller.appspotmail.com
> Signed-off-by: Zheng Bin <zhengbin13@huawei.com>
> ---

Reviewed-by: Eric Biggers <ebiggers@google.com>

