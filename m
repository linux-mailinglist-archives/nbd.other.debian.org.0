Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 91869AFC024
	for <lists+nbd@lfdr.de>; Tue,  8 Jul 2025 03:42:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5CD7920555; Tue,  8 Jul 2025 01:42:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jul  8 01:42:12 2025
Old-Return-Path: <hdanton@sina.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E3C05204AD
	for <lists-other-nbd@bendel.debian.org>; Tue,  8 Jul 2025 01:25:17 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.197 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 9os2SYglkXEp for <lists-other-nbd@bendel.debian.org>;
	Tue,  8 Jul 2025 01:25:12 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .sina. - helo: .smtp153-170.sina. - helo-domain: .sina.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
X-Greylist: delayed 87580 seconds by postgrey-1.36 at bendel; Tue, 08 Jul 2025 01:25:11 UTC
Received: from smtp153-170.sina.com.cn (smtp153-170.sina.com.cn [61.135.153.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id DAEAF20486
	for <nbd@other.debian.org>; Tue,  8 Jul 2025 01:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1751937912;
	bh=cwQOjk547Zv2ATJFdaw5csYgtoidNunSGL/zW6G3ct0=;
	h=From:Subject:Date:Message-ID;
	b=hpURiFrQOzDztWkOeILr2Te7RRtU8LsYZ+meknOKE1BHlRlJYi0N++CJOt7DGb1ib
	 ddgp+nUGHlmqQei86lm4lbepG8moUSdhLephcPyn+6C7r7CI7cbiKHWZROcKJ0lzi/
	 9n388Us30l2JBqcZ5etQjKcqD7indcF7XIUaqX+o=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.34) with ESMTP
	id 686C736C00007618; Tue, 8 Jul 2025 09:25:02 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 2721056291940
X-SMAIL-UIID: 95D3E90001004F7D881C813250BA6C25-20250708-092502-1
From: Hillf Danton <hdanton@sina.com>
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Bart Van Assche <bvanassche@acm.org>,
	axboe@kernel.dk,
	josef@toxicpanda.com,
	linux-block@vger.kernel.org,
	syzbot <syzbot+3dbc6142c85cc77eaf04@syzkaller.appspotmail.com>,
	Ming Lei <ming.lei@redhat.com>,
	linux-kernel@vger.kernel.org,
	nbd@other.debian.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [nbd?] possible deadlock in nbd_queue_rq
Date: Tue,  8 Jul 2025 09:24:49 +0800
Message-ID: <20250708012450.2858-1-hdanton@sina.com>
In-Reply-To: <b8769d22-fa19-4374-bbcc-be3f06f420bf@I-love.SAKURA.ne.jp>
References: <20250707005946.2669-1-hdanton@sina.com> <20250708001848.2775-1-hdanton@sina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <_PdipfVLADF.A.gS2E.0dHboB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3410
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20250708012450.2858-1-hdanton@sina.com
Resent-Date: Tue,  8 Jul 2025 01:42:12 +0000 (UTC)

On Tue, 8 Jul 2025 09:52:18 +0900 Tetsuo Handa wrote:
> On 2025/07/08 9:18, Hillf Danton wrote:
> > On Mon, 7 Jul 2025 10:39:44 -0700 Bart Van Assche wrote:
> >> On 7/6/25 5:59 PM, Hillf Danton wrote:
> >>> and given the second one, the report is false positive.
> >>
> >> Whether or not this report is a false positive, the root cause should be
> >> fixed because lockdep disables itself after the first circular locking
> >> complaint. From print_usage_bug() in kernel/locking/lockdep.c:
> >>
> >> 	if (!debug_locks_off() || debug_locks_silent)
> >> 		return;
> >>
> > The root cause could be walked around for example by trying not to init
> > nbd more than once.
> 
> How did you come to think so?
> 
Based on that nbd_init appears twice in the lock chain syzbot reported.

> nbd_init() is already called only once because of module_init(nbd_init).
> 
Ok Bart is misguiding.

