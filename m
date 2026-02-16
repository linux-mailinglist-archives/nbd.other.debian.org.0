Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLddHTr1kmko0gEAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Mon, 16 Feb 2026 11:45:14 +0100
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC7A142778
	for <lists+nbd@lfdr.de>; Mon, 16 Feb 2026 11:45:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id EBD7D206D6; Mon, 16 Feb 2026 10:45:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Feb 16 10:45:13 2026
Old-Return-Path: <dwagner@suse.de>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A11BB206A6
	for <lists-other-nbd@bendel.debian.org>; Mon, 16 Feb 2026 10:27:24 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.2 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id lVIv6Np6vpPv for <lists-other-nbd@bendel.debian.org>;
	Mon, 16 Feb 2026 10:27:17 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .suse. - helo: .smtp-out1.suse. - helo-domain: .suse.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id D59C0206B1
	for <nbd@other.debian.org>; Mon, 16 Feb 2026 10:27:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 709F33E6EF;
	Mon, 16 Feb 2026 10:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771237611; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jiR2ZjzsH+TbpZ8dWUKhjhEhCBp20SYV/pfGiHv004o=;
	b=mDwJoE6lYGSqy7KgYWfcFgECanCDZk3awgJswbfWfXzGi59AklgDKjf9QW7RgloTdY1gP0
	jg/HuBnUpslZvoOSNWDe0fvUtP5PSEPPs1dl9qW4OibFT8DyTuAWsR3vbywH1v7zxcCmiT
	FU51Fbigzoq1wo/fqnFsTSuN+6PTjyk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771237611;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jiR2ZjzsH+TbpZ8dWUKhjhEhCBp20SYV/pfGiHv004o=;
	b=5zJWdHoemC5WLO6iPVN83AklrTl41tBz+T3lk+62U+eCBTPwh373uShG+sfkVdNUVJzfil
	Ku810sqGtu8uucCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mDwJoE6l;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5zJWdHoe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771237611; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jiR2ZjzsH+TbpZ8dWUKhjhEhCBp20SYV/pfGiHv004o=;
	b=mDwJoE6lYGSqy7KgYWfcFgECanCDZk3awgJswbfWfXzGi59AklgDKjf9QW7RgloTdY1gP0
	jg/HuBnUpslZvoOSNWDe0fvUtP5PSEPPs1dl9qW4OibFT8DyTuAWsR3vbywH1v7zxcCmiT
	FU51Fbigzoq1wo/fqnFsTSuN+6PTjyk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771237611;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jiR2ZjzsH+TbpZ8dWUKhjhEhCBp20SYV/pfGiHv004o=;
	b=5zJWdHoemC5WLO6iPVN83AklrTl41tBz+T3lk+62U+eCBTPwh373uShG+sfkVdNUVJzfil
	Ku810sqGtu8uucCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 54E743EA64;
	Mon, 16 Feb 2026 10:26:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Jqu0FOvwkmkONgAAD6G6ig
	(envelope-from <dwagner@suse.de>); Mon, 16 Feb 2026 10:26:51 +0000
Date: Mon, 16 Feb 2026 11:26:42 +0100
From: Daniel Wagner <dwagner@suse.de>
To: Chaitanya Kulkarni <chaitanyak@nvidia.com>
Cc: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>, 
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, 
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, 
	"nbd@other.debian.org" <nbd@other.debian.org>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Subject: Re: blktests failures with v6.19 kernel
Message-ID: <1a4f4064-8352-49c3-a7f5-3883c2c13025@flourine.local>
References: <aY7ZBfMjVIhe_wh3@shinmob>
 <6ad314f7-f3d2-495a-b1ef-a81a06498952@flourine.local>
 <f26001d6-062e-402b-8acd-46a737523e23@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f26001d6-062e-402b-8acd-46a737523e23@nvidia.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <eMHxf1MAo9B.A.gbxK.5UvkpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3492
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/1a4f4064-8352-49c3-a7f5-3883c2c13025@flourine.local
Resent-Date: Mon, 16 Feb 2026 10:45:13 +0000 (UTC)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.01 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chaitanyak@nvidia.com,m:shinichiro.kawasaki@wdc.com,m:linux-block@vger.kernel.org,m:linux-nvme@lists.infradead.org,m:linux-scsi@vger.kernel.org,m:nbd@other.debian.org,m:linux-rdma@vger.kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_SPF_NA(0.00)[no SPF record];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER(0.00)[dwagner@suse.de,bounce-nbd=lists@other.debian.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[flourine.local:mid,suse.de:dkim,bendel.debian.org:helo,bendel.debian.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[dwagner@suse.de,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[nbd];
	ASN(0.00)[asn:8365, ipnet:2001:41b8::/29, country:DE];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1BC7A142778
X-Rspamd-Action: no action

Hi Chaitanya,

On Sat, Feb 14, 2026 at 09:19:47PM +0000, Chaitanya Kulkarni wrote:
> On 2/13/26 01:56, Daniel Wagner wrote:
> > nvmet_fc_target_assoc_free runs in the nvmet_wq context and calls
> >
> >    nvmet_fc_delete_target_queue
> >      nvmet_cq_put
> >        nvmet_cq_destroy
> >          nvmet_ctrl_put
> >           nvmet_ctrl_free
> >             flush_work(&ctrl->async_event_work);
> >             cancel_work_sync(&ctrl->fatal_err_work);
> >   
> > The async_event_work could be running on nvmet_wq. So this deadlock is
> > real. No idea how to fix it yet.
> >
> 
> Can following patch be the potential fix for above issue as well ?
> totally untested ...

Yes this should work. I was not so happy adding a workqueue for this but
after looking at nvme, this seems acceptable approach. Though, I'd make
nvmet follow the nvme and instead adding an AEN workqueue, rather have a
nvmet-reset-wq or nvmet_delete-wq.

Thanks,
Daniel

