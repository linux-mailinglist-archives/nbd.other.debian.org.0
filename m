Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 239CBAD04F7
	for <lists+nbd@lfdr.de>; Fri,  6 Jun 2025 17:15:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 08AE520709; Fri,  6 Jun 2025 15:15:23 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jun  6 15:15:22 2025
Old-Return-Path: <dwagner@suse.de>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 497FF206E6
	for <lists-other-nbd@bendel.debian.org>; Fri,  6 Jun 2025 14:58:51 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.398 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id gydavHM-y2rf for <lists-other-nbd@bendel.debian.org>;
	Fri,  6 Jun 2025 14:58:45 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .suse. - helo: .smtp-out2.suse. - helo-domain: .suse.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
X-Greylist: delayed 93312 seconds by postgrey-1.36 at bendel; Fri, 06 Jun 2025 14:58:45 UTC
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 7B7D4206CA
	for <nbd@other.debian.org>; Fri,  6 Jun 2025 14:58:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0625F1F445;
	Fri,  6 Jun 2025 14:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749221920; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ti/Py6dJ0naeNjX5F1k8KYleDnBdjDj8FiSaldxcGVE=;
	b=aGGGm7oJv6CPTBdNX4ovBls6qBfTQ91csqAs1c1CgwtR47QKMIDdgwpck0OQ/ZWWRI9vsZ
	/X5cNY8XqBTM+qbsTtGzXemcMucLr30vEplzjymcorvZlaJZ8lL8SKUmY+5MviFfTfFF2K
	flkJIRBgH62FUsKZblFfUTHnJkTlj8Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749221920;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ti/Py6dJ0naeNjX5F1k8KYleDnBdjDj8FiSaldxcGVE=;
	b=YKa4Y/+GP/n6rSitlwQ7WRRkTtp3fu37O23sIYy/rr6BUKpsJAK7wHb7VqBl09QbKqu3NI
	91DG1q/c1x1DVVBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=aGGGm7oJ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="YKa4Y/+G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749221920; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ti/Py6dJ0naeNjX5F1k8KYleDnBdjDj8FiSaldxcGVE=;
	b=aGGGm7oJv6CPTBdNX4ovBls6qBfTQ91csqAs1c1CgwtR47QKMIDdgwpck0OQ/ZWWRI9vsZ
	/X5cNY8XqBTM+qbsTtGzXemcMucLr30vEplzjymcorvZlaJZ8lL8SKUmY+5MviFfTfFF2K
	flkJIRBgH62FUsKZblFfUTHnJkTlj8Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749221920;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ti/Py6dJ0naeNjX5F1k8KYleDnBdjDj8FiSaldxcGVE=;
	b=YKa4Y/+GP/n6rSitlwQ7WRRkTtp3fu37O23sIYy/rr6BUKpsJAK7wHb7VqBl09QbKqu3NI
	91DG1q/c1x1DVVBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E83E21369F;
	Fri,  6 Jun 2025 14:58:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NrRqOB8CQ2iHIAAAD6G6ig
	(envelope-from <dwagner@suse.de>); Fri, 06 Jun 2025 14:58:39 +0000
Date: Fri, 6 Jun 2025 16:58:31 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Yi Zhang <yi.zhang@redhat.com>
Cc: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>, 
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, 
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, 
	"nbd@other.debian.org" <nbd@other.debian.org>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, 
	Tomas Bzatek <tbzatek@redhat.com>
Subject: Re: blktests failures with v6.15 kernel
Message-ID: <38a8ec1a-dbca-43f1-b0fa-79f0361bbc0b@flourine.local>
References: <2xsfqvnntjx5iiir7wghhebmnugmpfluv6ef22mghojgk6gilr@mvjscqxroqqk>
 <7cdceac2-ef72-4917-83a2-703f8f93bd64@flourine.local>
 <rcirbjhpzv6ojqc5o33cl3r6l7x72adaqp7k2uf6llgvcg5pfh@qy5ii2yfi2b2>
 <CAHj4cs8SqXUpbT49v29ugG1Q36g5KrGAHtHu6sSjiH19Ct_vJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHj4cs8SqXUpbT49v29ugG1Q36g5KrGAHtHu6sSjiH19Ct_vJA@mail.gmail.com>
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 0625F1F445
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <e7CKaQ06ZSC.A.7dsG.KYwQoB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3385
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/38a8ec1a-dbca-43f1-b0fa-79f0361bbc0b@flourine.local
Resent-Date: Fri,  6 Jun 2025 15:15:23 +0000 (UTC)

On Fri, Jun 06, 2025 at 10:25:25PM +0800, Yi Zhang wrote:
> > As of today, CKI project keeps on reporting the failure:
> >
> >   https://datawarehouse.cki-project.org/kcidb/tests/redhat:1851238698-aarch64-kernel_upt_7
> >
> > Yi, do you think the new libnvme release will help to silence the failure
> 
> I've created one CKI issue to track the nvme/023 failure, so the
> failure will be waived in the future test.
> 
> > reports? I'm guessing the release will help RedHat to pick up and apply to CKI
> 
> Yes, if we have the new release for libnvme, our Fedora libnvme
> maintainer can build the new one for Fedora. I also created the Fedora
> issue to track it on libnvme side.

Sure; a stop gap solution, just don't build with liburing. In hindsight,
I should have set it to disabled per default, will do it now.

FWIW, the contributor for the io_uring feature, stated that it improved
the performance for some workloads. Though, I think the whole
integration is sub-optimal, as a new io_uring is created/configured for
each get_log_page call. So only for a large transfers there is going to
help.

I am currently working on libnvme 2 and I think we can improve this
quite a bit though. But for libnvme 1 I'd  recommend to disable
liburing.

