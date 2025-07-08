Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D9DAFD1F9
	for <lists+nbd@lfdr.de>; Tue,  8 Jul 2025 18:42:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D8337205C2; Tue,  8 Jul 2025 16:42:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jul  8 16:42:10 2025
Old-Return-Path: <bvanassche@acm.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 38457205FE
	for <lists-other-nbd@bendel.debian.org>; Tue,  8 Jul 2025 16:24:04 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.898 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id qQtjt2ulhVhD for <lists-other-nbd@bendel.debian.org>;
	Tue,  8 Jul 2025 16:23:57 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_MX=-3.1 (check from: .acm. - helo: .003.mia.mailroute. - helo-domain: .mailroute.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -6.6
Received: from 003.mia.mailroute.net (003.mia.mailroute.net [199.89.3.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mailroute.net", Issuer "R10" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 770B9205DF
	for <nbd@other.debian.org>; Tue,  8 Jul 2025 16:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4bc5yd3LCvzlgqy6;
	Tue,  8 Jul 2025 16:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1751991831; x=1754583832; bh=5hNTFrE0bpBaPPbMXhxAESHB
	Yjh+m+dxnlVSSAeGXAU=; b=f58eezT/silJaQsprkEDvvH9KkUwFlNnp0hirGGg
	1rsUrHdyIWJ7wGX+W+1QB5IXr7n5poiEbhGZfKAZtir0K0gjYaDoK0r8bNks4w4f
	G8avDIh5ZetwZHKH0vmXZ+6bavSCrQ+enyz2kgT+ZxdYPQylWAFTShEngIN6ys8h
	SPWBj8F6Kd0we+va8KpCEWPgNTbGFyiGlJWIQQ3yPGSW514AW3JligIIopquQzqM
	JWMJ3Oj3ddZ63XrTAW2BMc6yWCrnvsLg1lAHk8uKcd9F+9furB/QyDUA6Jw83MmZ
	f9JRp8JoK9mDCPVO+GVWpD5vhPSOTL5QykJn8ZdYrd7h9w==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 3XEFc24SopK7; Tue,  8 Jul 2025 16:23:51 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4bc5yS2pY3zlgqVj;
	Tue,  8 Jul 2025 16:23:43 +0000 (UTC)
Message-ID: <d9894a7d-3531-4c2a-a016-1b560a13b2d8@acm.org>
Date: Tue, 8 Jul 2025 09:23:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [nbd?] possible deadlock in nbd_queue_rq
To: Hillf Danton <hdanton@sina.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: axboe@kernel.dk, josef@toxicpanda.com, linux-block@vger.kernel.org,
 syzbot <syzbot+3dbc6142c85cc77eaf04@syzkaller.appspotmail.com>,
 Ming Lei <ming.lei@redhat.com>, linux-kernel@vger.kernel.org,
 nbd@other.debian.org, syzkaller-bugs@googlegroups.com
References: <20250707005946.2669-1-hdanton@sina.com>
 <20250708001848.2775-1-hdanton@sina.com>
 <20250708012450.2858-1-hdanton@sina.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250708012450.2858-1-hdanton@sina.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <_Xy2NhCOi_B.A.U5PD.ipUboB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3416
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/d9894a7d-3531-4c2a-a016-1b560a13b2d8@acm.org
Resent-Date: Tue,  8 Jul 2025 16:42:10 +0000 (UTC)

On 7/7/25 6:24 PM, Hillf Danton wrote:
>> nbd_init() is already called only once because of module_init(nbd_init).
>>
> Ok Bart is misguiding.

No, I'm not. I didn't write anything about nbd_init().

