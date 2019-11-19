Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 29398102A74
	for <lists+nbd@lfdr.de>; Tue, 19 Nov 2019 18:03:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E65122099B; Tue, 19 Nov 2019 17:03:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov 19 17:03:08 2019
Old-Return-Path: <mchristi@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,DKIM_VERIFIED,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id BCA3B20943
	for <lists-other-nbd@bendel.debian.org>; Tue, 19 Nov 2019 16:47:28 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.48 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id hJ220reaHHuJ for <lists-other-nbd@bendel.debian.org>;
	Tue, 19 Nov 2019 16:47:22 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.7
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by bendel.debian.org (Postfix) with ESMTP id A548E207CA
	for <nbd@other.debian.org>; Tue, 19 Nov 2019 16:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574182036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=goFlWtu6657uFH0FTG7Kqe2ghLRVHCFg1wiXEeK4vRA=;
	b=V0bprU8N5eSr6k0wWDjDunTr3Vrh0Kwh5pqxOv6xeoPwSNAuYMR62ULN0m64c9/Oh8lfWZ
	Svs9kiqEyfCra75AJrnM1ebaeNqi8+6D+3ZjJERSqLT42IebLkquyQrD/YKv0NSm0RyDCs
	kogM9YdSwGJTDh6Y8W2YO2pNJkQ7bJA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-zvdIGgUkMg-PRDObvulrRQ-1; Tue, 19 Nov 2019 11:46:03 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91D38107ACC4;
	Tue, 19 Nov 2019 16:46:02 +0000 (UTC)
Received: from [10.10.121.199] (ovpn-121-199.rdu2.redhat.com [10.10.121.199])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CB8D71B42F;
	Tue, 19 Nov 2019 16:46:01 +0000 (UTC)
Subject: Re: [PATCH 0/2] nbd: local daemon restart support
To: nbd@other.debian.org, axboe@kernel.dk, josef@toxicpanda.com,
 linux-block@vger.kernel.org
References: <20191116055017.6253-1-mchristi@redhat.com>
From: Mike Christie <mchristi@redhat.com>
Message-ID: <5DD41C49.3080209@redhat.com>
Date: Tue, 19 Nov 2019 10:46:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <20191116055017.6253-1-mchristi@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: zvdIGgUkMg-PRDObvulrRQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <gvVBeoG36JF.A.GMG.MBC1dB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/743
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/5DD41C49.3080209@redhat.com
Resent-Date: Tue, 19 Nov 2019 17:03:08 +0000 (UTC)

On 11/15/2019 11:50 PM, Mike Christie wrote:
> The following patches made over Linus's tree allow setups that are
> using AF_UNIX sockets with a local daemon to recover from crashes
> or to upgrade the daemon while IO is running without having to
> disrupt the application (no need to reopen the device or handle IO
> errors). They basically just use the existing failover
> infrastructure, but to failover to a new socket from a non-dead
> socket.

Josef and Jens,

I am dropping this patchset. Do not bother reviewing it. I will post
something else later.


