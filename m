Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CB9BBE15D
	for <lists+nbd@lfdr.de>; Mon, 06 Oct 2025 14:48:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CCE6B2073B; Mon,  6 Oct 2025 12:48:23 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Oct  6 12:48:23 2025
Old-Return-Path: <dwagner@suse.de>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FVGT_m_MULTI_ODD autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 399FB206EE
	for <lists-other-nbd@bendel.debian.org>; Mon,  6 Oct 2025 12:31:17 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.18 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FVGT_m_MULTI_ODD=0.02]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id iXRsaTsmHiHL for <lists-other-nbd@bendel.debian.org>;
	Mon,  6 Oct 2025 12:31:11 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .suse. - helo: .smtp-out1.suse. - helo-domain: .suse.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id BA41020676
	for <nbd@other.debian.org>; Mon,  6 Oct 2025 12:31:11 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BDC4D336CB;
	Mon,  6 Oct 2025 12:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759753842; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DH/E8tdqQkikeQeW9VrxwMtlsxz2Qi0OG9Sx1VZcu7Q=;
	b=qYELF5GQ/fEzIt6b6U/00fnf8TZ4Am9FPXKWPtwfM2jNyOIHcAiJUmj6vTLEB1sTpsQBS5
	2RVl1SNqRt6kE+l0zwPAzWSBsbK6MVE69gUNxLrnsb80VLa6IUgECnqGq5mV5YFpQj2uiF
	k13SsPzszmzPE07BrK6HwwmEhEmdKz4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759753842;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DH/E8tdqQkikeQeW9VrxwMtlsxz2Qi0OG9Sx1VZcu7Q=;
	b=crxqOEWAKQga4pFbqrJrAPtOIrT9lTPYsnddKqsPCPaB2cX/gIIm/zikz36s6JNoBnXr9/
	XlagKGba+KJdj1BQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=i9FFLlfw;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=KLmWKvyW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759753840; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DH/E8tdqQkikeQeW9VrxwMtlsxz2Qi0OG9Sx1VZcu7Q=;
	b=i9FFLlfwoi6YO3QSmRJX2BbkmHa/vi/HYrvDb8+80Z6+fo6dHWx6n4FU7Uhhreem7fvng/
	3XwvaEm1BuRvxMTLOfYUlf64xOjxyS2tRqcRPADMzDw76sKu3IO+R3BInbHhr1U1X9kbHV
	lAKIs/EYEmuOfnSzCIp1uhkBW6M9Jys=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759753840;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DH/E8tdqQkikeQeW9VrxwMtlsxz2Qi0OG9Sx1VZcu7Q=;
	b=KLmWKvyW/TQznlozFKG995pOwzVwtAuHepkeU1dXa1VBokbG36OsFgtyjvepq6mXh9Xf2x
	fI7q0uXX/AqgndBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A451213995;
	Mon,  6 Oct 2025 12:30:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Uc4oJ3C242hwdwAAD6G6ig
	(envelope-from <dwagner@suse.de>); Mon, 06 Oct 2025 12:30:40 +0000
Date: Mon, 6 Oct 2025 14:30:32 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, 
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, 
	"nbd@other.debian.org" <nbd@other.debian.org>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Subject: Re: blktests failures with v6.17 kernel
Message-ID: <6f615e86-d160-41a2-a078-478406e4c749@flourine.local>
References: <3bbujxlhhzxufnihiyhssmknscdcqt7igyvzbhwf3sxdgbruma@kw5cf6u5npan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bbujxlhhzxufnihiyhssmknscdcqt7igyvzbhwf3sxdgbruma@kw5cf6u5npan>
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: BDC4D336CB
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <i47xDZs8iCF.A.UePN.Xq74oB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3446
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/6f615e86-d160-41a2-a078-478406e4c749@flourine.local
Resent-Date: Mon,  6 Oct 2025 12:48:23 +0000 (UTC)

On Thu, Oct 02, 2025 at 10:35:48AM +0000, Shinichiro Kawasaki wrote:
> #2: nvme/041 (fc transport)
> 
>     The test case nvme/041 fails for fc transport. Refer to the report for the
>     v6.12 kernel [4].
> 
>     [4] https://lore.kernel.org/linux-nvme/6crydkodszx5vq4ieox3jjpwkxtu7mhbohypy24awlo5w7f4k6@to3dcng24rd4/

Thanks for reminding me. I'll have to update the nvme-fc-sync series
This should finally allow to pass all tests for the FC transport. 

[1] https://lore.kernel.org/linux-nvme/20250829-nvme-fc-sync-v3-0-d69c87e63aee@kernel.org/

