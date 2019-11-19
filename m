Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id A984810123C
	for <lists+nbd@lfdr.de>; Tue, 19 Nov 2019 04:36:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7A1C820934; Tue, 19 Nov 2019 03:36:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov 19 03:36:12 2019
Old-Return-Path: <ebiggers@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,DKIM_VERIFIED,
	FOURLA,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 09747206F3
	for <lists-other-nbd@bendel.debian.org>; Tue, 19 Nov 2019 03:20:12 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.081 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_HI=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id DVrM0a0lwJYY for <lists-other-nbd@bendel.debian.org>;
	Tue, 19 Nov 2019 03:20:07 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id CAB92206F1
	for <nbd@other.debian.org>; Tue, 19 Nov 2019 03:20:04 +0000 (UTC)
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net [24.5.143.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 811A42230F;
	Tue, 19 Nov 2019 03:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1574133600;
	bh=3H8618+VZUATiI2/5A4JcV1lJ5zgJKbaPCe1NM/Frhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C+ZSeX7WtzWw+bDNgjLTNoRFPKHkyXIzhwHNBrBg5uwCRy7Z672TtlGUuudTab4UN
	 oO+2ESxb6DFOD1OOVp5DMCs9Dqtm1DRoy/taFfPcKwmWJbobkWsHnBRtppZCRZxr7f
	 FeRlA5SGbLqbR4WZ3IilPr8U1/Dss5Bgb2XHf01c=
Date: Mon, 18 Nov 2019 19:19:59 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Sun Ke <sunke32@huawei.com>
Cc: josef@toxicpanda.com, axboe@kernel.dk, linux-block@vger.kernel.org,
	nbd@other.debian.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nbd:fix memory leak in nbd_get_socket()
Message-ID: <20191119031959.GK3147@sol.localdomain>
References: <1574133408-77202-1-git-send-email-sunke32@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1574133408-77202-1-git-send-email-sunke32@huawei.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <x6gE3E7Ws4M.A.CzH.sM20dB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/737
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20191119031959.GK3147@sol.localdomain
Resent-Date: Tue, 19 Nov 2019 03:36:12 +0000 (UTC)

On Tue, Nov 19, 2019 at 11:16:48AM +0800, Sun Ke wrote:
> Before return NULL,put the sock first.
> 
> Fixes: cf1b2326b734 ("nbd: verify socket is supported during setup")

Since this commit went to stable kernels, can you add Cc stable to this one?

Thanks,

- Eric

