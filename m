Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB65ACF070
	for <lists+nbd@lfdr.de>; Thu,  5 Jun 2025 15:27:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7D87320554; Thu,  5 Jun 2025 13:27:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun  5 13:27:11 2025
Old-Return-Path: <dwagner@suse.de>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FVGT_m_MULTI_ODD,MD5_SHA1_SUM
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 102412076A
	for <lists-other-nbd@bendel.debian.org>; Thu,  5 Jun 2025 13:10:40 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.08 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FVGT_m_MULTI_ODD=0.02, MD5_SHA1_SUM=-1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id zC6CbRYv4dyB for <lists-other-nbd@bendel.debian.org>;
	Thu,  5 Jun 2025 13:10:34 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 447 seconds by postgrey-1.36 at bendel; Thu, 05 Jun 2025 13:10:34 UTC
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 7299A20763
	for <nbd@other.debian.org>; Thu,  5 Jun 2025 13:10:32 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A51E3345B2;
	Thu,  5 Jun 2025 13:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749128583; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FiQfaBUdLpG0izU+n3dwo6IxIx6W2D/15BOpRHmYH38=;
	b=IOCIQeVtn3JIpKgPBF/6Dud02iAzz3JWYtG2SdpHp+1qCcZ1m4nN0CbFVlF3wNu7NBFYni
	kEi3N/zmRcADp+nfkm1yMY4WcWZ/nNxKAecjLf0zM8AEd9yWHJy6o1lk16RfkXLLAvA8Cf
	Zne19P9ERQrlULg0r6jADX6SJDFzGvM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749128583;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FiQfaBUdLpG0izU+n3dwo6IxIx6W2D/15BOpRHmYH38=;
	b=woLlgr8ha1Iq6fu8KGJx6OA9UlIWNjM+gZNxEbET5dWYc3AqgyH5tsXsAiiUuZbC7TYyDg
	ed6hC/HX5zK53fDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=IOCIQeVt;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=woLlgr8h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749128583; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FiQfaBUdLpG0izU+n3dwo6IxIx6W2D/15BOpRHmYH38=;
	b=IOCIQeVtn3JIpKgPBF/6Dud02iAzz3JWYtG2SdpHp+1qCcZ1m4nN0CbFVlF3wNu7NBFYni
	kEi3N/zmRcADp+nfkm1yMY4WcWZ/nNxKAecjLf0zM8AEd9yWHJy6o1lk16RfkXLLAvA8Cf
	Zne19P9ERQrlULg0r6jADX6SJDFzGvM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749128583;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FiQfaBUdLpG0izU+n3dwo6IxIx6W2D/15BOpRHmYH38=;
	b=woLlgr8ha1Iq6fu8KGJx6OA9UlIWNjM+gZNxEbET5dWYc3AqgyH5tsXsAiiUuZbC7TYyDg
	ed6hC/HX5zK53fDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 87D2C137FE;
	Thu,  5 Jun 2025 13:03:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YuG/HoeVQWhxKQAAD6G6ig
	(envelope-from <dwagner@suse.de>); Thu, 05 Jun 2025 13:03:03 +0000
Date: Thu, 5 Jun 2025 15:02:54 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, 
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, 
	"nbd@other.debian.org" <nbd@other.debian.org>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Subject: Re: blktests failures with v6.15 kernel
Message-ID: <7cdceac2-ef72-4917-83a2-703f8f93bd64@flourine.local>
References: <2xsfqvnntjx5iiir7wghhebmnugmpfluv6ef22mghojgk6gilr@mvjscqxroqqk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2xsfqvnntjx5iiir7wghhebmnugmpfluv6ef22mghojgk6gilr@mvjscqxroqqk>
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim]
X-Rspamd-Queue-Id: A51E3345B2
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <aRAwPPfSiFO.A.lgOB.vsZQoB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3382
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/7cdceac2-ef72-4917-83a2-703f8f93bd64@flourine.local
Resent-Date: Thu,  5 Jun 2025 13:27:11 +0000 (UTC)

Hi,

On Thu, May 29, 2025 at 08:46:35AM +0000, Shinichiro Kawasaki wrote:
> #1: nvme/023
> 
>     When libnvme has version 1.13 or later and built with liburing, nvme-cli
>     command "nvme smart-log" command fails for namespace block devices. This
>     makes the test case nvme/032 fail [2]. Fix in libnvme is expected.
> 
>     [2]
>     https://lore.kernel.org/linux-nvme/32c3e9ef-ab3c-40b5-989a-7aa323f5d611@flourine.local/T/#m6519ce3e641e7011231d955d9002d1078510e3ee

Should be fixed now. If you want, I can do another release soon, so the
fix get packaged up by the distros.

> #2: nvme/041 (fc transport)
> 
>     The test case nvme/041 fails for fc transport. Refer to the report for v6.12
>     kernel [3].
> 
>     [3]
>     https://lore.kernel.org/linux-nvme/6crydkodszx5vq4ieox3jjpwkxtu7mhbohypy24awlo5w7f4k6@to3dcng24rd4/

Is still on my TODO list. Sorry.

> #4: nvme/061 failure (fc transport)
> 
>     The test case nvme/061 sometimes fails due to a WARN [5]. Just before the
>     WARN, The kernel reported "refcount_t: underflow; use-after-free." This
>     failure can be recreated in stable manner by repeating the test case 10
>     times or so.
> 
>     I tried v6.15-rcX kernels. When I ran v6.15-rc1 kernel, the test case always
>     failed with different symptom. With v6.15-rc2 kernel, the test case passed
>     in most runs, but sometimes it failed with the same symptom as v6.15. I
>     guess the nvme-fc changes in v6.15-rc2 fixed most of the refcounting issue,
>     but still rare refcounting failure scenario is left.

The nvmet-fcloop changes for 6.16 should address this (fingers crossed).

Thanks,
Daniel

