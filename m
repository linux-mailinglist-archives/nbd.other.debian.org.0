Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AB1B39BFB
	for <lists+nbd@lfdr.de>; Thu, 28 Aug 2025 13:51:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id F082320A16; Thu, 28 Aug 2025 11:51:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Aug 28 11:51:11 2025
Old-Return-Path: <dwagner@suse.de>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=4.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FOURLA,FVGT_m_MULTI_ODD,MD5_SHA1_SUM autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id EF6E220A5C
	for <lists-other-nbd@bendel.debian.org>; Thu, 28 Aug 2025 11:33:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.08 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FVGT_m_MULTI_ODD=0.02, MD5_SHA1_SUM=-1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 8R9MKOpbaYo7 for <lists-other-nbd@bendel.debian.org>;
	Thu, 28 Aug 2025 11:33:09 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 0A88F20A5B
	for <nbd@other.debian.org>; Thu, 28 Aug 2025 11:33:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8ACEE21E00;
	Thu, 28 Aug 2025 11:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756380785; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nDBbpYYqSB5yXQjk2/9a0sEktjKGihTIib3At2S16rY=;
	b=Y00ACjZx0/M0I+BO8pj890eiofCwNE31j3jd9WLCaXzfinz0IGMFs+SX9gkgxUm1SSYKr0
	l0LGRH4Bbz13Z2c3zB1V6t8xJz+GM1Mfs/hw6kkh0fh0Xu997GYVO2euajn8Guv1Pg3zLx
	rSxy+V517gTlibqyAdfCT4YUwMZR6dA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756380785;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nDBbpYYqSB5yXQjk2/9a0sEktjKGihTIib3At2S16rY=;
	b=6++6OaBQXt4evqnG5Z9K9jLAcBl/ylDZMmc3F+OxuVCDBZrmizaGEEH7T0NeptMjgHQCcI
	OSkmlzdrmy68hOBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756380785; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nDBbpYYqSB5yXQjk2/9a0sEktjKGihTIib3At2S16rY=;
	b=Y00ACjZx0/M0I+BO8pj890eiofCwNE31j3jd9WLCaXzfinz0IGMFs+SX9gkgxUm1SSYKr0
	l0LGRH4Bbz13Z2c3zB1V6t8xJz+GM1Mfs/hw6kkh0fh0Xu997GYVO2euajn8Guv1Pg3zLx
	rSxy+V517gTlibqyAdfCT4YUwMZR6dA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756380785;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nDBbpYYqSB5yXQjk2/9a0sEktjKGihTIib3At2S16rY=;
	b=6++6OaBQXt4evqnG5Z9K9jLAcBl/ylDZMmc3F+OxuVCDBZrmizaGEEH7T0NeptMjgHQCcI
	OSkmlzdrmy68hOBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7BA3613326;
	Thu, 28 Aug 2025 11:33:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id POZmHXE+sGgMaAAAD6G6ig
	(envelope-from <dwagner@suse.de>); Thu, 28 Aug 2025 11:33:05 +0000
Date: Thu, 28 Aug 2025 13:33:04 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, 
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, 
	"nbd@other.debian.org" <nbd@other.debian.org>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Subject: Re: blktests failures with v6.17-rc1 kernel
Message-ID: <6ef89cb5-1745-4b98-9203-51ba6de40799@flourine.local>
References: <suhzith2uj75uiprq4m3cglvr7qwm3d7gi4tmjeohlxl6fcmv3@zu6zym6nmvun>
 <ff748a3f-9f07-4933-b4b3-b4f58aacac5b@flourine.local>
 <rsdinhafrtlguauhesmrrzkybpnvwantwmyfq2ih5aregghax5@mhr7v3eryci3>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="h2ijb4czulrzbkl4"
Content-Disposition: inline
In-Reply-To: <rsdinhafrtlguauhesmrrzkybpnvwantwmyfq2ih5aregghax5@mhr7v3eryci3>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	HAS_ATTACHMENT(0.00)[]
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <HoyfOoIVxqL.A.zavG.vKEsoB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3424
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/6ef89cb5-1745-4b98-9203-51ba6de40799@flourine.local
Resent-Date: Thu, 28 Aug 2025 11:51:11 +0000 (UTC)


--h2ijb4czulrzbkl4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 28, 2025 at 05:55:06AM +0000, Shinichiro Kawasaki wrote:
> On Aug 27, 2025 / 12:10, Daniel Wagner wrote:
> > On Wed, Aug 13, 2025 at 10:50:34AM +0000, Shinichiro Kawasaki wrote:
> > > #4: nvme/061 (fc transport)
> > > 
> > >     The test case nvme/061 sometimes fails for fc transport due to a WARN and
> > >     refcount message "refcount_t: underflow; use-after-free." Refer to the
> > >     report for the v6.15 kernel [5].
> > > 
> > >     [5]
> > >     https://lore.kernel.org/linux-block/2xsfqvnntjx5iiir7wghhebmnugmpfluv6ef22mghojgk6gilr@mvjscqxroqqk/
> > 
> > This one might be fixed with
> > 
> > https://lore.kernel.org/linux-nvme/20250821-fix-nvmet-fc-v1-1-3349da4f416e@kernel.org/
> 
> I applied this patch on top of v6.17-rc3 kernel, but still I observe the
> refcount WARN at nvme/061 with.

Thanks for testing and I was able to reproduce it also. The problem is
that it's possible that an association is scheduled for deletion twice.

Would you mind to give the attached patch a try? It fixes the problem I
was able to reproduce.

> Said that, I like the patch. This week, I noticed that nvme/030 hangs with fc
> transport. This hang is rare, but it is recreated in stable manner when I
> repeat the test case. I tried the fix patch, and it avoided this hang :)
> Thanks for the fix!

Ah, nice so at least this one is fixed by the first patch :)

--h2ijb4czulrzbkl4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-nvmet-fc-avoid-scheduling-association-deletion-twice.patch"

>From b0db044f5e828d5c12c368fecd17327f7a6e854d Mon Sep 17 00:00:00 2001
From: Daniel Wagner <wagi@kernel.org>
Date: Thu, 28 Aug 2025 13:18:21 +0200
Subject: [PATCH] nvmet-fc: avoid scheduling association deletion twice

When forcefully shutting down a port via the configfs interface,
nvmet_port_subsys_drop_link() first calls nvmet_port_del_ctrls() and
then nvmet_disable_port(). Both functions will eventually schedule all
remaining associations for deletion.

The current implementation checks whether an association is about to be
removed, but only after the work item has already been scheduled. As a
result, it is possible for the first scheduled work item to free all
resources, and then for the same work item to be scheduled again for
deletion.

Because the association list is an RCU list, it is not possible to take
a lock and remove the list entry directly, so it cannot be looked up
again. Instead, a flag (terminating) must be used to determine whether
the association is already in the process of being deleted.

Signed-off-by: Daniel Wagner <wagi@kernel.org>
---
 drivers/nvme/target/fc.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/nvme/target/fc.c b/drivers/nvme/target/fc.c
index 6725c34dd7c9..7d84527d5a43 100644
--- a/drivers/nvme/target/fc.c
+++ b/drivers/nvme/target/fc.c
@@ -1075,6 +1075,14 @@ nvmet_fc_delete_assoc_work(struct work_struct *work)
 static void
 nvmet_fc_schedule_delete_assoc(struct nvmet_fc_tgt_assoc *assoc)
 {
+	int terminating;
+
+	terminating = atomic_xchg(&assoc->terminating, 1);
+
+	/* if already terminating, do nothing */
+	if (terminating)
+		return;
+
 	nvmet_fc_tgtport_get(assoc->tgtport);
 	if (!queue_work(nvmet_wq, &assoc->del_work))
 		nvmet_fc_tgtport_put(assoc->tgtport);
@@ -1202,13 +1210,7 @@ nvmet_fc_delete_target_assoc(struct nvmet_fc_tgt_assoc *assoc)
 {
 	struct nvmet_fc_tgtport *tgtport = assoc->tgtport;
 	unsigned long flags;
-	int i, terminating;
-
-	terminating = atomic_xchg(&assoc->terminating, 1);
-
-	/* if already terminating, do nothing */
-	if (terminating)
-		return;
+	int i;
 
 	spin_lock_irqsave(&tgtport->lock, flags);
 	list_del_rcu(&assoc->a_list);
-- 
2.51.0


--h2ijb4czulrzbkl4--

