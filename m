Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OVqfFmUvSmqw/AAAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Sun, 05 Jul 2026 12:18:13 +0200
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A089C709BB6
	for <lists+nbd@lfdr.de>; Sun, 05 Jul 2026 12:18:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=fygo-io.20200929.dkim.larksuite.com header.s=s1 header.b="gk3Dfo/K";
	dmarc=fail reason="No valid SPF, DKIM not aligned (relaxed)" header.from=fygo.io (policy=quarantine);
	spf=none (mail.lfdr.de: domain of "bounce-nbd=lists+nbd=lfdr.de@other.debian.org" has no SPF policy when checking 82.195.75.100) smtp.mailfrom="bounce-nbd=lists+nbd=lfdr.de@other.debian.org"
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 30E81207E1; Sun,  5 Jul 2026 10:18:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Jul  5 10:18:11 2026
Old-Return-Path: <yukuai@fygo.io>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MSGID_FROM_MTA_HEADER autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 406F520690
	for <lists-other-nbd@bendel.debian.org>; Sun,  5 Jul 2026 10:02:41 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MSGID_FROM_MTA_HEADER=3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id zeB8_kBhMQ1u for <lists-other-nbd@bendel.debian.org>;
	Sun,  5 Jul 2026 10:02:34 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .fygo. - helo: .va-2-58.ptr.blmpb. - helo-domain: .blmpb.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from va-2-58.ptr.blmpb.com (va-2-58.ptr.blmpb.com [209.127.231.58])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 8D5FB20635
	for <nbd@other.debian.org>; Sun,  5 Jul 2026 10:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fygo-io.20200929.dkim.larksuite.com; t=1783245741;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=yzvPQSNoglOkROzTkgdF2ri4FeOBblQ3Sl+BLD/Ep1g=;
 b=gk3Dfo/Ko5a7eb+MToZo8ES1JwM+J4NSuIfIMDxzDAk+HbgVOclEraOnwfiJWz4lFvX/1C
 fq/BelbbxywTDOwcEcQMYbrIvOJ104JicN5d8yQ63dbQMJ2xgsXOdqItZa/YmeoWAZVAg9
 LFm/6otRqpgwB0X3XGAQwV+y/b4u9EcO5WgjKWVSqXcqi2MJ4ao48O3iY28yRb0a81nGiK
 u33Gbkn4eekth3VCTqKl+xaoIpCPdINMOvh2vXa6PAP5MvLrnU6Bhc9KC+P5LUc74JQkNn
 5r6Jk1HsrM3sBqaE+z5pSuuDwxLbjb8VM4bisDeM8Z2Bv8cU/Ln36Mk9NmbBqg==
In-Reply-To: <20260625084458.4171890-3-yangerkun@huawei.com>
From: "yu kuai" <yukuai@fygo.io>
Message-Id: <913d11fc-0fb8-4111-b995-7fe7e893025e@fygo.io>
User-Agent: Mozilla Thunderbird
References: <20260625084458.4171890-1-yangerkun@huawei.com> <20260625084458.4171890-3-yangerkun@huawei.com>
X-Original-From: yu kuai <yukuai@fygo.io>
X-Lms-Return-Path: <lba+26a4a2bad+91c2a3+other.debian.org+yukuai@fygo.io>
Reply-To: yukuai@fygo.io
Cc: <yi.zhang@huawei.com>, <chengzhihao1@huawei.com>, 
	<echo.chenlin@huawei.com>, <leo.lilong@huaweicloud.com>, 
	<wangkefeng.wang@huawei.com>, <linux-block@vger.kernel.org>, 
	<nbd@other.debian.org>
Subject: Re: [PATCH v2 2/5] nbd: replace socks pointer array with xarray
Received: from [192.168.1.104] ([39.182.0.144]) by smtp.larksuite.com with ESMTPS; Sun, 05 Jul 2026 10:02:20 +0000
Content-Transfer-Encoding: quoted-printable
To: "Yang Erkun" <yangerkun@huawei.com>, <josef@toxicpanda.com>, 
	<axboe@kernel.dk>, <hch@lst.de>, <yukuai@fygo.io>
Date: Sun, 5 Jul 2026 18:02:16 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <_L3N-SMFGC.A.1ZcB.j9iSqB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3578
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/913d11fc-0fb8-4111-b995-7fe7e893025e@fygo.io
Resent-Date: Sun,  5 Jul 2026 10:18:11 +0000 (UTC)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.39 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[fygo.io : No valid SPF, DKIM not aligned (relaxed),quarantine];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[fygo-io.20200929.dkim.larksuite.com:s=s1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[82.195.75.100:from];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yi.zhang@huawei.com,m:chengzhihao1@huawei.com,m:echo.chenlin@huawei.com,m:leo.lilong@huaweicloud.com,m:wangkefeng.wang@huawei.com,m:linux-block@vger.kernel.org,m:nbd@other.debian.org,m:yangerkun@huawei.com,m:josef@toxicpanda.com,m:axboe@kernel.dk,m:hch@lst.de,m:yukuai@fygo.io,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[fygo-io.20200929.dkim.larksuite.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	FORGED_SENDER(0.00)[yukuai@fygo.io,bounce-nbd=lists@other.debian.org];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	R_SPF_NA(0.00)[no SPF record];
	HAS_REPLYTO(0.00)[yukuai@fygo.io];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yukuai@fygo.io,bounce-nbd=lists@other.debian.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:8365, ipnet:82.195.64.0/19, country:DE];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[nbd];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,fygo-io.20200929.dkim.larksuite.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A089C709BB6

Hi,

=E5=9C=A8 2026/6/25 16:44, Yang Erkun =E5=86=99=E9=81=93:
> Replace the krealloc-based struct nbd_sock **socks array with struct
> xarray socks. Each nbd sock is fully initialized before being stored
> into the xarray via xa_store(), ensuring concurrent readers calling
> xa_load() never observe a partially initialized socket.
>
> Convert all array index accesses to xa_load() and open-coded for-loops
> to xa_for_each().
>
> Signed-off-by: Long Li<leo.lilong@huawei.com>

xarray may not be good idea for IO hot path because of the overhead.

https://lore.kernel.org/all/60f9a88b-b750-3579-bdfd-5421f2040406@huaweiclou=
d.com/

--=20
Thanks,
Kuai

