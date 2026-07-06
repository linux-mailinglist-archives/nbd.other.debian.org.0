Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hvycHUchS2rAMAEAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Mon, 06 Jul 2026 05:30:15 +0200
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 6060170C53E
	for <lists+nbd@lfdr.de>; Mon, 06 Jul 2026 05:30:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=A43vFO46;
	dkim=pass header.d=huawei.com header.s=dkim header.b=A43vFO46;
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	spf=none (mail.lfdr.de: domain of "bounce-nbd=lists+nbd=lfdr.de@other.debian.org" has no SPF policy when checking 82.195.75.100) smtp.mailfrom="bounce-nbd=lists+nbd=lfdr.de@other.debian.org"
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E7FAC20696; Mon,  6 Jul 2026 03:30:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jul  6 03:30:12 2026
Old-Return-Path: <yangerkun@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 351302068E
	for <lists-other-nbd@bendel.debian.org>; Mon,  6 Jul 2026 03:12:43 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.5 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ufYii857JHjg for <lists-other-nbd@bendel.debian.org>;
	Mon,  6 Jul 2026 03:12:38 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 1151 seconds by postgrey-1.36 at bendel; Mon, 06 Jul 2026 03:12:38 UTC
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 9D4DE2068D
	for <nbd@other.debian.org>; Mon,  6 Jul 2026 03:12:38 +0000 (UTC)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=LZQUYh6PUVtEJYKAfkZ1pxp5ssa4uHVmRk1UcW+yKbQ=;
	b=A43vFO46q1/PaD0m9rYfhsHSJPUMyx+efIPkI+15bNft4QICONlhFnM+qZUAVE0iL+QXgR0zn
	RzLnvE4iQ0AK2BavYCZhc71/64iYDjjo+/52PCVlTFkjN5mO3X9/Z82Q3GJvrvvrPO8foh/SZC7
	Q+WIZDVhUxLO5x29djKbRE0=
Received: from canpmsgout09.his.huawei.com (unknown [172.19.92.135])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4gtpmk6H7gz1BFtX
	for <nbd@other.debian.org>; Mon,  6 Jul 2026 10:52:22 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=LZQUYh6PUVtEJYKAfkZ1pxp5ssa4uHVmRk1UcW+yKbQ=;
	b=A43vFO46q1/PaD0m9rYfhsHSJPUMyx+efIPkI+15bNft4QICONlhFnM+qZUAVE0iL+QXgR0zn
	RzLnvE4iQ0AK2BavYCZhc71/64iYDjjo+/52PCVlTFkjN5mO3X9/Z82Q3GJvrvvrPO8foh/SZC7
	Q+WIZDVhUxLO5x29djKbRE0=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4gtpZT6kpdz1cyPR;
	Mon,  6 Jul 2026 10:43:29 +0800 (CST)
Received: from kwepemf100006.china.huawei.com (unknown [7.202.181.220])
	by mail.maildlp.com (Postfix) with ESMTPS id 2272240578;
	Mon,  6 Jul 2026 10:52:41 +0800 (CST)
Received: from [10.174.176.240] (10.174.176.240) by
 kwepemf100006.china.huawei.com (7.202.181.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Mon, 6 Jul 2026 10:52:40 +0800
Message-ID: <f84f8508-3752-4874-8222-04739d8c9568@huawei.com>
Date: Mon, 6 Jul 2026 10:52:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] nbd: replace socks pointer array with xarray
To: <yukuai@fygo.io>, <josef@toxicpanda.com>, <axboe@kernel.dk>, <hch@lst.de>
CC: <yi.zhang@huawei.com>, <chengzhihao1@huawei.com>,
	<echo.chenlin@huawei.com>, <leo.lilong@huaweicloud.com>,
	<wangkefeng.wang@huawei.com>, <linux-block@vger.kernel.org>,
	<nbd@other.debian.org>
References: <20260625084458.4171890-1-yangerkun@huawei.com>
 <20260625084458.4171890-3-yangerkun@huawei.com>
 <913d11fc-0fb8-4111-b995-7fe7e893025e@fygo.io>
From: yangerkun <yangerkun@huawei.com>
In-Reply-To: <913d11fc-0fb8-4111-b995-7fe7e893025e@fygo.io>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.176.240]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemf100006.china.huawei.com (7.202.181.220)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <pug3Ta_Ls-N.A.9n6O.EFySqB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3580
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/f84f8508-3752-4874-8222-04739d8c9568@huawei.com
Resent-Date: Mon,  6 Jul 2026 03:30:12 +0000 (UTC)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[huawei.com:D:+];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[82.195.75.100:from];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yukuai@fygo.io,m:josef@toxicpanda.com,m:axboe@kernel.dk,m:hch@lst.de,m:yi.zhang@huawei.com,m:chengzhihao1@huawei.com,m:echo.chenlin@huawei.com,m:leo.lilong@huaweicloud.com,m:wangkefeng.wang@huawei.com,m:linux-block@vger.kernel.org,m:nbd@other.debian.org,s:lists@lfdr.de];
	R_SPF_NA(0.00)[no SPF record];
	FORGED_SENDER(0.00)[yangerkun@huawei.com,bounce-nbd=lists@other.debian.org];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yangerkun@huawei.com,bounce-nbd=lists@other.debian.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:8365, ipnet:82.195.64.0/19, country:DE];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[other.debian.org:from_smtp,huawei.com:from_mime,huawei.com:email,huawei.com:mid,huawei.com:dkim];
	TAGGED_RCPT(0.00)[nbd];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6060170C53E



在 2026/7/5 18:02, yu kuai 写道:
> Hi,
> 
> 在 2026/6/25 16:44, Yang Erkun 写道:
>> Replace the krealloc-based struct nbd_sock **socks array with struct
>> xarray socks. Each nbd sock is fully initialized before being stored
>> into the xarray via xa_store(), ensuring concurrent readers calling
>> xa_load() never observe a partially initialized socket.
>>
>> Convert all array index accesses to xa_load() and open-coded for-loops
>> to xa_for_each().
>>
>> Signed-off-by: Long Li<leo.lilong@huawei.com>
> 
> xarray may not be good idea for IO hot path because of the overhead.
> 
> https://lore.kernel.org/all/60f9a88b-b750-3579-bdfd-5421f2040406@huaweicloud.com/
> 

Hi,

Thanks for your review! Yeah, this may lead a little overhead for io hot 
path, I will try to find another way.

Thanks,
Erkun.

