Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8DBAD05EC
	for <lists+nbd@lfdr.de>; Fri,  6 Jun 2025 17:48:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7AD1B206DC; Fri,  6 Jun 2025 15:48:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jun  6 15:48:11 2025
Old-Return-Path: <dwagner@suse.de>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5B4E020698
	for <lists-other-nbd@bendel.debian.org>; Fri,  6 Jun 2025 15:31:56 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.1 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id DCEJpCv59sWa for <lists-other-nbd@bendel.debian.org>;
	Fri,  6 Jun 2025 15:31:50 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id D188720636
	for <nbd@other.debian.org>; Fri,  6 Jun 2025 15:31:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1FC1C336A1;
	Fri,  6 Jun 2025 15:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749223900; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sTaxRHKwF+vzmXr0h8gchfeJdwPaFIf2cEMCCW/n7+A=;
	b=kdo2FLY6uImYG5myX98OBi1M5XgqczBq0Pj7pql0UDXaqgIoVf3R531K9uUlUTdyygWzO5
	GvheP0Nt5TJtxV53GFB/kbLM24NaPDSVCriNYC4BWFHwn8u/pL3Np7E4CkzXsfwML2Afgy
	LZ7AmLGGC3tuQ7Ke8oZ1dw25q54fQHo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749223900;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sTaxRHKwF+vzmXr0h8gchfeJdwPaFIf2cEMCCW/n7+A=;
	b=0YFAcE5iTeNsslsFY3deRp4aKNCW6rXvHCWSidKaiIDLu8LWQ+TRPaCBB3vLKq7/MtpHhA
	vyDej2B7YEVbPxDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749223900; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sTaxRHKwF+vzmXr0h8gchfeJdwPaFIf2cEMCCW/n7+A=;
	b=kdo2FLY6uImYG5myX98OBi1M5XgqczBq0Pj7pql0UDXaqgIoVf3R531K9uUlUTdyygWzO5
	GvheP0Nt5TJtxV53GFB/kbLM24NaPDSVCriNYC4BWFHwn8u/pL3Np7E4CkzXsfwML2Afgy
	LZ7AmLGGC3tuQ7Ke8oZ1dw25q54fQHo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749223900;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sTaxRHKwF+vzmXr0h8gchfeJdwPaFIf2cEMCCW/n7+A=;
	b=0YFAcE5iTeNsslsFY3deRp4aKNCW6rXvHCWSidKaiIDLu8LWQ+TRPaCBB3vLKq7/MtpHhA
	vyDej2B7YEVbPxDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0EFA31336F;
	Fri,  6 Jun 2025 15:31:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mXxgA9wJQ2g7LAAAD6G6ig
	(envelope-from <dwagner@suse.de>); Fri, 06 Jun 2025 15:31:40 +0000
Date: Fri, 6 Jun 2025 17:31:39 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Yi Zhang <yi.zhang@redhat.com>, 
	Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>, "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, 
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, 
	"nbd@other.debian.org" <nbd@other.debian.org>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, 
	Tomas Bzatek <tbzatek@redhat.com>
Subject: Re: blktests failures with v6.15 kernel
Message-ID: <d1e5aefd-9669-4638-9466-951e69df1176@flourine.local>
References: <2xsfqvnntjx5iiir7wghhebmnugmpfluv6ef22mghojgk6gilr@mvjscqxroqqk>
 <7cdceac2-ef72-4917-83a2-703f8f93bd64@flourine.local>
 <rcirbjhpzv6ojqc5o33cl3r6l7x72adaqp7k2uf6llgvcg5pfh@qy5ii2yfi2b2>
 <CAHj4cs8SqXUpbT49v29ugG1Q36g5KrGAHtHu6sSjiH19Ct_vJA@mail.gmail.com>
 <38a8ec1a-dbca-43f1-b0fa-79f0361bbc0b@flourine.local>
 <14194a5f-e320-45e0-8f6c-019ce3bd4dbe@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14194a5f-e320-45e0-8f6c-019ce3bd4dbe@kernel.dk>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[flourine.local:mid,imap1.dmz-prg2.suse.org:helo]
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <5-7FX-Hbn2B.A.M2yG.72wQoB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3387
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/d1e5aefd-9669-4638-9466-951e69df1176@flourine.local
Resent-Date: Fri,  6 Jun 2025 15:48:11 +0000 (UTC)

On Fri, Jun 06, 2025 at 09:03:11AM -0600, Jens Axboe wrote:
> On 6/6/25 8:58 AM, Daniel Wagner wrote:
> > FWIW, the contributor for the io_uring feature, stated that it improved
> > the performance for some workloads. Though, I think the whole
> > integration is sub-optimal, as a new io_uring is created/configured for
> > each get_log_page call. So only for a large transfers there is going to
> > help.
> 
> That's crazy... What commit is that?

adee4ed1c8c8 ("ioctl: get_log_page by nvme uring cmd")

ioctl: get_log_page by nvme uring cmd
Use io_uring for fetching log pages.

This showed about a 10% performance improvement for some large log pages.


https://github.com/linux-nvme/libnvme/commit/adee4ed1c8c8

Should I rip it out? I am not really attached to it.

