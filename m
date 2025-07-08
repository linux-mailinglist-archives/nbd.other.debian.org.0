Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B45DAFBF3D
	for <lists+nbd@lfdr.de>; Tue,  8 Jul 2025 02:36:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0FAD62047E; Tue,  8 Jul 2025 00:36:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jul  8 00:36:11 2025
Old-Return-Path: <hdanton@sina.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DCA6020511
	for <lists-other-nbd@bendel.debian.org>; Tue,  8 Jul 2025 00:19:17 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.195 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id eGIaoEiIWkrS for <lists-other-nbd@bendel.debian.org>;
	Tue,  8 Jul 2025 00:19:06 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail3-165.sinamail.sina.com.cn (mail3-165.sinamail.sina.com.cn [202.108.3.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 71F5A204E7
	for <nbd@other.debian.org>; Tue,  8 Jul 2025 00:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1751933946;
	bh=DW4AhCBbeiArax0m21d22MWOoGbYI1cZ1thox4sliRs=;
	h=From:Subject:Date:Message-ID;
	b=vZHQuIqcP1oxUh4a3GHn62V8+xqg/s9krha9zmLEBg6tq3/mPvuLn+xkOCyTLjrF4
	 pBH7TEBFg/jqQ6QgCMWD2YWVQFqISlCNLRxc34CdPkHr7+VFsFDF6dMbYDc0Hfxiz7
	 EwibKX8Myb9an/+83K4gUB9+XeWJZ/OpDXZSrS9A=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.33) with ESMTP
	id 686C63F200003BF3; Tue, 8 Jul 2025 08:19:00 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 1675456685312
X-SMAIL-UIID: C398EA41875643F785817AF7FB17703F-20250708-081900-1
From: Hillf Danton <hdanton@sina.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: axboe@kernel.dk,
	josef@toxicpanda.com,
	linux-block@vger.kernel.org,
	syzbot <syzbot+3dbc6142c85cc77eaf04@syzkaller.appspotmail.com>,
	Ming Lei <ming.lei@redhat.com>,
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
	linux-kernel@vger.kernel.org,
	nbd@other.debian.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [nbd?] possible deadlock in nbd_queue_rq
Date: Tue,  8 Jul 2025 08:18:47 +0800
Message-ID: <20250708001848.2775-1-hdanton@sina.com>
In-Reply-To: <f6909d1f-0a53-447c-b3d0-369574d2d721@acm.org>
References: <20250707005946.2669-1-hdanton@sina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <HYDbJor_UmI.A.0esB.6fGboB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3409
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20250708001848.2775-1-hdanton@sina.com
Resent-Date: Tue,  8 Jul 2025 00:36:11 +0000 (UTC)

On Mon, 7 Jul 2025 10:39:44 -0700 Bart Van Assche wrote:
> On 7/6/25 5:59 PM, Hillf Danton wrote:
> > and given the second one, the report is false positive.
> 
> Whether or not this report is a false positive, the root cause should be
> fixed because lockdep disables itself after the first circular locking
> complaint. From print_usage_bug() in kernel/locking/lockdep.c:
> 
> 	if (!debug_locks_off() || debug_locks_silent)
> 		return;
> 
The root cause could be walked around for example by trying not to init
nbd more than once.

--- x/drivers/block/nbd.c
+++ y/drivers/block/nbd.c
@@ -2620,8 +2620,12 @@ static void nbd_dead_link_work(struct wo
 
 static int __init nbd_init(void)
 {
+	static int inited = 0;
 	int i;
 
+	if (inited)
+		return 0;
+	inited++;
 	BUILD_BUG_ON(sizeof(struct nbd_request) != 28);
 
 	if (max_part < 0) {

