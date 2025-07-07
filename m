Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EF9AFBA51
	for <lists+nbd@lfdr.de>; Mon,  7 Jul 2025 20:03:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 22F6C20524; Mon,  7 Jul 2025 18:03:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jul  7 18:03:10 2025
Old-Return-Path: <bvanassche@acm.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1B9A120507
	for <lists-other-nbd@bendel.debian.org>; Mon,  7 Jul 2025 17:46:57 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.898 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Fn7loEIpBLEn for <lists-other-nbd@bendel.debian.org>;
	Mon,  7 Jul 2025 17:46:49 +0000 (UTC)
X-policyd-weight: using cached result; rate: -6.6
X-Greylist: delayed 409 seconds by postgrey-1.36 at bendel; Mon, 07 Jul 2025 17:46:49 UTC
Received: from 004.mia.mailroute.net (004.mia.mailroute.net [199.89.3.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mailroute.net", Issuer "R10" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 8F11720500
	for <nbd@other.debian.org>; Mon,  7 Jul 2025 17:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4bbWhq5bKDzm0ySG;
	Mon,  7 Jul 2025 17:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1751909993; x=1754501994; bh=jo1ezI3yg8pDe+rN9VdHGNjY
	QJTmcSIi+8PfDwfiijE=; b=XRufL2tJdVxjU2RRAyaT2I38aGt8E1OjOCkP4dN7
	AXalL2QIKRBBI774gtJ0hNpeTOpO1oZQN4Q353+PE0Lp/lWrtOpwPYhHYkWO1Uie
	X9qRaF2dhUURQA63yUPzlazquMBmDILjywVquRYqngRouSvAWm+wCOpRgLHdzJB/
	joq7VJEZwxc4lAaZceTaOHWB9hYf0936iHdnYcl3RDnw7kxQ+VoPMdXOMO63Nnmk
	ZjLsyJG4qoaUSXiP/6JYpSmZaIM7wpnztlP9ICij2790239b/T4FqA7tgc0Q7IBA
	5BoLTl2uewN8Bc3cUQ+3VB8h+8IiH1EK8+/NjX7VqQf1hg==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id j79FvH-RSEao; Mon,  7 Jul 2025 17:39:53 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4bbWhf5Qptzm0yTF;
	Mon,  7 Jul 2025 17:39:45 +0000 (UTC)
Message-ID: <f6909d1f-0a53-447c-b3d0-369574d2d721@acm.org>
Date: Mon, 7 Jul 2025 10:39:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [nbd?] possible deadlock in nbd_queue_rq
To: Hillf Danton <hdanton@sina.com>,
 syzbot <syzbot+3dbc6142c85cc77eaf04@syzkaller.appspotmail.com>
Cc: axboe@kernel.dk, josef@toxicpanda.com, linux-block@vger.kernel.org,
 Ming Lei <ming.lei@redhat.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 linux-kernel@vger.kernel.org, nbd@other.debian.org,
 syzkaller-bugs@googlegroups.com
References: <20250707005946.2669-1-hdanton@sina.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250707005946.2669-1-hdanton@sina.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <l3oMoAureP.A.14EN.evAboB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3407
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/f6909d1f-0a53-447c-b3d0-369574d2d721@acm.org
Resent-Date: Mon,  7 Jul 2025 18:03:10 +0000 (UTC)

On 7/6/25 5:59 PM, Hillf Danton wrote:
> and given the second one, the report is false positive.

Whether or not this report is a false positive, the root cause should be
fixed because lockdep disables itself after the first circular locking
complaint. From print_usage_bug() in kernel/locking/lockdep.c:

	if (!debug_locks_off() || debug_locks_silent)
		return;

Bart.

