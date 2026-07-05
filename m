Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 84niNpIsSmot/AAAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Sun, 05 Jul 2026 12:06:10 +0200
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 8071E709ABC
	for <lists+nbd@lfdr.de>; Sun, 05 Jul 2026 12:06:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=fygo-io.20200929.dkim.larksuite.com header.s=s1 header.b=Xd6lnBBF;
	dmarc=fail reason="No valid SPF, DKIM not aligned (relaxed)" header.from=fygo.io (policy=quarantine);
	spf=none (mail.lfdr.de: domain of "bounce-nbd=lists+nbd=lfdr.de@other.debian.org" has no SPF policy when checking 2001:41b8:202:deb:216:36ff:fe40:4002) smtp.mailfrom="bounce-nbd=lists+nbd=lfdr.de@other.debian.org"
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5F191207C2; Sun,  5 Jul 2026 10:06:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Jul  5 10:06:10 2026
Old-Return-Path: <yukuai@fygo.io>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7D146204C2
	for <lists-other-nbd@bendel.debian.org>; Sun,  5 Jul 2026 09:48:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id jPu7HlCGXVfX for <lists-other-nbd@bendel.debian.org>;
	Sun,  5 Jul 2026 09:48:14 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .fygo. - helo: .va-2-47.ptr.blmpb. - helo-domain: .blmpb.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
X-Greylist: delayed 931 seconds by postgrey-1.36 at bendel; Sun, 05 Jul 2026 09:48:14 UTC
Received: from va-2-47.ptr.blmpb.com (va-2-47.ptr.blmpb.com [209.127.231.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 473512049B
	for <nbd@other.debian.org>; Sun,  5 Jul 2026 09:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fygo-io.20200929.dkim.larksuite.com; t=1783243953;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=yfmo+Opzuf9+9Y6texDec4/pAC1ruAiFfECAfXs3mT4=;
 b=Xd6lnBBFX6bPLeFS448dJ+s0XAhRBS+i/fKVR64kfP0b9mde6m806bQDVHWv9G1SSPTP12
 KBf83yDKpRBuL3p2JUeq5fRS/0QItdLBYU/cBz2B3zL6DIDQKqRQnATenn+hLu3YsFcYYO
 K7DDu2LKQ5HjU6Ca4wOPev75ntB19Fg4X0hvfRTCfyE5fiuaGfGFiWGkVpCtYjwdeew+DK
 m0SkYql8xA+VEhsxWbBHNL0siASqlSkO9132hkMoutg+Ij79ylulAmFd0ZlnSb/6g1P4C7
 tUxe3fOHkef8CukCpEEcw1plQUPLv+7YXAhkpBlxOZ3E2ySeaF66oJBYUcGOCQ==
Content-Transfer-Encoding: quoted-printable
X-Original-From: yu kuai <yukuai@fygo.io>
References: <20260625084458.4171890-1-yangerkun@huawei.com> <20260625084458.4171890-2-yangerkun@huawei.com>
Mime-Version: 1.0
Received: from [192.168.1.104] ([39.182.0.144]) by smtp.larksuite.com with ESMTPS; Sun, 05 Jul 2026 09:32:32 +0000
In-Reply-To: <20260625084458.4171890-2-yangerkun@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-Lms-Return-Path: <lba+26a4a24b1+d41fbb+other.debian.org+yukuai@fygo.io>
From: "yu kuai" <yukuai@fygo.io>
Date: Sun, 5 Jul 2026 17:32:27 +0800
Message-Id: <40aef437-bfd6-4484-ba4b-04adf192be86@fygo.io>
User-Agent: Mozilla Thunderbird
Reply-To: yukuai@fygo.io
Cc: <yi.zhang@huawei.com>, <chengzhihao1@huawei.com>, 
	<echo.chenlin@huawei.com>, <leo.lilong@huaweicloud.com>, 
	<wangkefeng.wang@huawei.com>, <linux-block@vger.kernel.org>, 
	<nbd@other.debian.org>
Subject: Re: [PATCH v2 1/5] nbd: simplify find_fallback() by removing redundant logic
To: "Yang Erkun" <yangerkun@huawei.com>, <josef@toxicpanda.com>, 
	<axboe@kernel.dk>, <hch@lst.de>, <yukuai@fygo.io>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <WMZVAtszXcP.A.LCPB.SyiSqB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3577
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/40aef437-bfd6-4484-ba4b-04adf192be86@fygo.io
Resent-Date: Sun,  5 Jul 2026 10:06:10 +0000 (UTC)
X-Rspamd-Action: add header
X-Spamd-Result: default: False [9.29 / 15.00];
	URIBL_BLACK(7.50)[fygo.io:from_mime,fygo.io:replyto,fygo.io:mid,fygo.io:email];
	DMARC_POLICY_QUARANTINE(1.50)[fygo.io : No valid SPF, DKIM not aligned (relaxed),quarantine];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yi.zhang@huawei.com,m:chengzhihao1@huawei.com,m:echo.chenlin@huawei.com,m:leo.lilong@huaweicloud.com,m:wangkefeng.wang@huawei.com,m:linux-block@vger.kernel.org,m:nbd@other.debian.org,m:yangerkun@huawei.com,m:josef@toxicpanda.com,m:axboe@kernel.dk,m:hch@lst.de,m:yukuai@fygo.io,s:lists@lfdr.de];
	R_DKIM_ALLOW(0.00)[fygo-io.20200929.dkim.larksuite.com:s=s1];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER(0.00)[yukuai@fygo.io,bounce-nbd=lists@other.debian.org];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	R_SPF_NA(0.00)[no SPF record];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yukuai@fygo.io,bounce-nbd=lists@other.debian.org];
	DKIM_TRACE(0.00)[fygo-io.20200929.dkim.larksuite.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[yukuai@fygo.io];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:8365, ipnet:2001:41b8::/29, country:DE];
	TAGGED_RCPT(0.00)[nbd];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bendel.debian.org:helo,bendel.debian.org:rdns,fygo.io:from_mime,fygo.io:replyto,fygo.io:mid,fygo.io:email,fygo-io.20200929.dkim.larksuite.com:dkim,huawei.com:email,other.debian.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8071E709ABC
X-Spam: Yes

=E5=9C=A8 2026/6/25 16:44, Yang Erkun =E5=86=99=E9=81=93:

> The second conditional checking nsock->fallback_index validity is the
> logical inverse of the first, so drop it and let execution fall through
> naturally. Consolidate the two identical dev_err_ratelimited() + return
> paths into a single no_fallback label to reduce duplication.
>
> Signed-off-by: Long Li<leo.lilong@huawei.com>
> ---
>   drivers/block/nbd.c | 37 ++++++++++++++-----------------------
>   1 file changed, 14 insertions(+), 23 deletions(-)
Reviewed-by: Yu Kuai <yukuai@fygo.io>

--=20
Thanks,
Kuai

