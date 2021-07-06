Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id D396B3BC4F1
	for <lists+nbd@lfdr.de>; Tue,  6 Jul 2021 04:57:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BC299203FA; Tue,  6 Jul 2021 02:57:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jul  6 02:57:09 2021
Old-Return-Path: <guoqing.jiang@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,TO_TOO_MANY autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A163720226
	for <lists-other-nbd@bendel.debian.org>; Tue,  6 Jul 2021 02:41:35 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.322 tagged_above=-10000 required=5.3
	tests=[BAYES_05=-1.5, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_MSPIKE_H4=0.001,
	RCVD_IN_MSPIKE_WL=0.001, TO_TOO_MANY=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Ms7DIr9h4NzE for <lists-other-nbd@bendel.debian.org>;
	Tue,  6 Jul 2021 02:41:32 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .linux. - helo: .out2.migadu. - helo-domain: .migadu.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 730FD201A0
	for <nbd@other.debian.org>; Tue,  6 Jul 2021 02:41:32 +0000 (UTC)
Subject: Re: [PATCH] block: nbd: fix order of cleaning up the queue and
 freeing the tagset
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1625539261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3F9gcIMfbZAZugjl+Gc1dc/E0wEPvESxt0ZR11S8uhk=;
	b=HFf+xWY7B6EYQJc8kOMC5nz/SISJnttX8PNc6OLaDzVEF2cKHzRpwNK17mw6pDnnKITUUl
	G1Ew1Bozw2yvSHU+JMS9I6csi/0Vk7OFoPN5uKx1a0uwuir0Sb8ms3jURtahdkQ9jkRDQY
	9DgXZa42F1C1eajXyxfJCjwES0xrBcg=
To: Wang Qing <wangqing@vivo.com>, Josef Bacik <josef@toxicpanda.com>,
 Jens Axboe <axboe@kernel.dk>, Chaitanya Kulkarni
 <chaitanya.kulkarni@wdc.com>, linux-block@vger.kernel.org,
 nbd@other.debian.org, linux-kernel@vger.kernel.org
References: <1625477143-18716-1-git-send-email-wangqing@vivo.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Guoqing Jiang <guoqing.jiang@linux.dev>
Message-ID: <d32f0c7c-4cbc-d754-817b-1c3f58a3e776@linux.dev>
Date: Tue, 6 Jul 2021 10:40:54 +0800
MIME-Version: 1.0
In-Reply-To: <1625477143-18716-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: guoqing.jiang@linux.dev
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <FgSauzLNDAM.A.DNF.Fa84gB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1218
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/d32f0c7c-4cbc-d754-817b-1c3f58a3e776@linux.dev
Resent-Date: Tue,  6 Jul 2021 02:57:09 +0000 (UTC)



On 7/5/21 5:25 PM, Wang Qing wrote:
> Must release the queue before freeing the tagset.
>
> Fixes: 1c99502fae35 ("loop: use blk_mq_alloc_disk and blk_cleanup_disk")
> Reported-and-tested-by: syzbot+9ca43ff47167c0ee3466@syzkaller.appspotmail.com

Did syzbot actually test the change?

> Signed-off-by: Wang Qing <wangqing@vivo.com>
> Signed-off-by: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>

I don't mind you sent it quickly, but pls remove my outdated mail account.

Guoqing

