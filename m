Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA699B65B
	for <lists+nbd@lfdr.de>; Fri, 23 Aug 2019 20:48:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C533120460; Fri, 23 Aug 2019 18:48:49 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 23 18:48:49 2019
Old-Return-Path: <wouter@grep.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,DKIM_VERIFIED,HEADER_FROM_DIFFERENT_DOMAINS,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 68BDB2047B
	for <lists-other-nbd@bendel.debian.org>; Fri, 23 Aug 2019 18:48:42 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.831 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id nJInw0MDYLYv for <lists-other-nbd@bendel.debian.org>;
	Fri, 23 Aug 2019 18:48:38 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from latin.grep.be (latin.grep.be [IPv6:2a01:4f8:140:52e5::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 0091B20460
	for <nbd@other.debian.org>; Fri, 23 Aug 2019 18:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=grep.be;
	s=2017.latin; h=Sender:In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=e7wsTJl6QOI6Q9EVw8/xuD/OXkt0OO7+/npHSalZAOk=; b=eRyW0p+n3tRTBjYatAmew90oW5
	L96WaLsHDyHrYcsbyL/XiS42jANqpZ1YYrkqr+X1fdZ6lcqYLiLtp0O/QqBbZWp5FpsbfmRKa+Gsn
	q0ogvdpjphgUzx7yVcNuc2NOIoro/pnCvBSpgC8bBK9/OB3ZrZr6ulOd03OAQcTweSvsxvSPPUWGV
	320ptQcOFUmtlgoz+DsCFtULa7KU7aKXdDeMj32W44+LfVFIgesz6Waa/sqI7t1YwgEyLHG81Xq29
	ZvBEfBmgpu8e8cR6uzUSx26ynBKMeivpsFeurFarmRriyCaYCGktsA6NbfoepFW/JKq4sD7dGLPiT
	KjcJVkXw==;
Received: from wouter by latin.grep.be with local (Exim 4.89)
	(envelope-from <wouter@grep.be>)
	id 1i1Eby-0003hv-Q2; Fri, 23 Aug 2019 20:48:34 +0200
Date: Fri, 23 Aug 2019 20:48:34 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, qemu-block@nongnu.org, qemu-devel@nongnu.org,
	libguestfs@redhat.com
Subject: Re: [PATCH 1/1] protocol: Add NBD_CMD_FLAG_FAST_ZERO
Message-ID: <20190823184834.brhsfbc4sdq5xuij@grep.be>
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
 <20190823143426.26838-1-eblake@redhat.com>
 <20190823143426.26838-2-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190823143426.26838-2-eblake@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: "Wouter Verhelst,,," <wouter@grep.be>
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <tME2uNCKYJC.A.oXH.RUDYdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/645
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190823184834.brhsfbc4sdq5xuij@grep.be
Resent-Date: Fri, 23 Aug 2019 18:48:49 +0000 (UTC)

On Fri, Aug 23, 2019 at 09:34:26AM -0500, Eric Blake wrote:
> +- bit 4, `NBD_CMD_FLAG_FAST_ZERO`; valid during
> +  `NBD_CMD_WRITE_ZEROES`. If set, but the server cannot perform the
> +  write zeroes any faster than it would for an equivalent
> +  `NBD_CMD_WRITE`,

One way of fulfilling the letter of this requirement but not its spirit
could be to have background writes; that is, the server makes a note
that the zeroed region should contain zeroes, makes an error-free reply
to the client, and then starts updating things in the background (with
proper layering so that an NBD_CMD_READ would see zeroes).

This could negatively impact performance after that command to the
effect that syncing the device would be slower rather than faster, if
not done right.

Do we want to keep that in consideration?

-- 
<Lo-lan-do> Home is where you have to wash the dishes.
  -- #debian-devel, Freenode, 2004-09-22

