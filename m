Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id E6222B3DDD3
	for <lists+nbd@lfdr.de>; Mon,  1 Sep 2025 11:18:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C31B420724; Mon,  1 Sep 2025 09:18:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep  1 09:18:10 2025
Old-Return-Path: <dwagner@suse.de>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_MED autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D56DE2066B
	for <lists-other-nbd@bendel.debian.org>; Mon,  1 Sep 2025 09:02:46 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.4 tagged_above=-10000 required=5.3
	tests=[BAYES_20=-1, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Zr7_ghF_H3kP for <lists-other-nbd@bendel.debian.org>;
	Mon,  1 Sep 2025 09:02:41 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .suse. - helo: .smtp-out2.suse. - helo-domain: .suse.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 76C572064C
	for <nbd@other.debian.org>; Mon,  1 Sep 2025 09:02:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3047C1F388;
	Mon,  1 Sep 2025 09:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756717336; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5NNItQtiBSkxwIsvVF62gD4BFcFmFvPJ0ltQD6wGBjM=;
	b=kEqJM6nywEAUgYQb4LPOCS9x9CjMVjfT2pnsMCSV9DTx/jgNqP8IZLV2t+plzC1sP9wMaL
	GOhKuDM0yWqpfeHp0cfONI9h9TLcBAWteTn9V0Or7jy/w+iMKKO2kGC6yzLNhG0hF6mwka
	bdi0JTTtuJOsZkiBNVwarHRzIqGBH18=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756717336;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5NNItQtiBSkxwIsvVF62gD4BFcFmFvPJ0ltQD6wGBjM=;
	b=5FxxqrJOXYxi7cIuJhJkfSbGklr2EzNlJDQByDz2Au4l+Js2PvkmKMv5kolMeUygTW4FHp
	T+tOdYG8QsLfJEDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756717336; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5NNItQtiBSkxwIsvVF62gD4BFcFmFvPJ0ltQD6wGBjM=;
	b=kEqJM6nywEAUgYQb4LPOCS9x9CjMVjfT2pnsMCSV9DTx/jgNqP8IZLV2t+plzC1sP9wMaL
	GOhKuDM0yWqpfeHp0cfONI9h9TLcBAWteTn9V0Or7jy/w+iMKKO2kGC6yzLNhG0hF6mwka
	bdi0JTTtuJOsZkiBNVwarHRzIqGBH18=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756717336;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5NNItQtiBSkxwIsvVF62gD4BFcFmFvPJ0ltQD6wGBjM=;
	b=5FxxqrJOXYxi7cIuJhJkfSbGklr2EzNlJDQByDz2Au4l+Js2PvkmKMv5kolMeUygTW4FHp
	T+tOdYG8QsLfJEDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 200681378C;
	Mon,  1 Sep 2025 09:02:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZJoTBxhhtWgnZgAAD6G6ig
	(envelope-from <dwagner@suse.de>); Mon, 01 Sep 2025 09:02:16 +0000
Date: Mon, 1 Sep 2025 11:02:15 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, 
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, 
	"nbd@other.debian.org" <nbd@other.debian.org>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Subject: Re: blktests failures with v6.17-rc1 kernel
Message-ID: <7a773833-a193-4243-80f4-fc52243883a9@flourine.local>
References: <suhzith2uj75uiprq4m3cglvr7qwm3d7gi4tmjeohlxl6fcmv3@zu6zym6nmvun>
 <ff748a3f-9f07-4933-b4b3-b4f58aacac5b@flourine.local>
 <rsdinhafrtlguauhesmrrzkybpnvwantwmyfq2ih5aregghax5@mhr7v3eryci3>
 <6ef89cb5-1745-4b98-9203-51ba6de40799@flourine.local>
 <u4ttvhnn7lark5w3sgrbuy2rxupcvosp4qmvj46nwzgeo5ausc@uyrkdls2muwx>
 <629ddb72-c10d-4930-9d81-61d7322ed3b0@flourine.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <629ddb72-c10d-4930-9d81-61d7322ed3b0@flourine.local>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <GgoulVKi-gO.A.MIsK.STWtoB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3427
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/7a773833-a193-4243-80f4-fc52243883a9@flourine.local
Resent-Date: Mon,  1 Sep 2025 09:18:10 +0000 (UTC)

On Mon, Sep 01, 2025 at 10:34:23AM +0200, Daniel Wagner wrote:
> The test is removing the ports while the host driver is about to
> reconnect and accesses a stale pointer.
> 
> nvme_fc_create_association is calling nvme_fc_ctlr_inactive_on_rport in
> the error path. The problem is that nvme_fc_create_association gets half
> through the setup and then fails. In the cleanup path
> 
> 	dev_warn(ctrl->ctrl.device,
> 		"NVME-FC{%d}: create_assoc failed, assoc_id %llx ret %d\n",
> 		ctrl->cnum, ctrl->association_id, ret);
> 
> is issued and then nvme_fc_ctlr_inactive_on_rport is called. And there
> is the log message above, so it's clear the error path is taken.
> 
> But the thing is fcloop is not supposed to remove the ports when the
> host driver is still using it. So there is a race window where it's
> possible to enter nvme_fc_create_assocation and fcloop removing the
> ports.
> 
> So between nvme_fc_create_assocation and nvme_fc_ctlr_active_on_rport.

I think the problem is that nvme_fc_create_association is not holding
the rport locks when checking the port_state and marking the rport
active. This races with nvme_fc_unregister_remoteport.

diff --git a/drivers/nvme/host/fc.c b/drivers/nvme/host/fc.c
index 3e12d4683ac7..03987f497a5b 100644
--- a/drivers/nvme/host/fc.c
+++ b/drivers/nvme/host/fc.c
@@ -3032,11 +3032,17 @@ nvme_fc_create_association(struct nvme_fc_ctrl *ctrl)

 	++ctrl->ctrl.nr_reconnects;

-	if (ctrl->rport->remoteport.port_state != FC_OBJSTATE_ONLINE)
+	spin_lock_irqsave(&ctrl->rport->lock, flags);
+	if (ctrl->rport->remoteport.port_state != FC_OBJSTATE_ONLINE) {
+		spin_unlock_irqrestore(&ctrl->rport->lock, flags);
 		return -ENODEV;
+	}

-	if (nvme_fc_ctlr_active_on_rport(ctrl))
+	if (nvme_fc_ctlr_active_on_rport(ctrl)) {
+		spin_unlock_irqrestore(&ctrl->rport->lock, flags);
 		return -ENOTUNIQ;
+	}
+	spin_unlock_irqrestore(&ctrl->rport->lock, flags);

 	dev_info(ctrl->ctrl.device,
 		"NVME-FC{%d}: create association : host wwpn 0x%016llx "

I'll to reproduce it and see if this patch does make a difference.

