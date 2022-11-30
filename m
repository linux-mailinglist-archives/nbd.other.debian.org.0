Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B0563D5B8
	for <lists+nbd@lfdr.de>; Wed, 30 Nov 2022 13:39:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 59633216A0; Wed, 30 Nov 2022 12:39:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Nov 30 12:39:11 2022
Old-Return-Path: <gnault@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A39EB2169B
	for <lists-other-nbd@bendel.debian.org>; Wed, 30 Nov 2022 12:21:13 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.304 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.515,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id EbWnB2qMBBGm for <lists-other-nbd@bendel.debian.org>;
	Wed, 30 Nov 2022 12:21:06 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 6F65121686
	for <nbd@other.debian.org>; Wed, 30 Nov 2022 12:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669810861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ew+rmcqxH2n7lRVyzxgZ+S2EuF0zHGkt1auf+7rBZUw=;
	b=f12TTve65UcusRARb+lMQVmQbhg2Bef2bLFQFeUcTyiZfqgFp29w+kSDamgIJY9JzS+TCq
	Pmvxz1UPL81TIKWp9h3ICqtFE9DkIOdCoscyu+h2ILQkZ1C2FzRNRq8m0qGs1GMtQx4fgM
	5/m9UY84zux1XdEgfmCneMUExP/G86o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-474-Wo7bNZhQOQuGXVIMaLzkvw-1; Wed, 30 Nov 2022 06:48:43 -0500
X-MC-Unique: Wo7bNZhQOQuGXVIMaLzkvw-1
Received: by mail-wm1-f71.google.com with SMTP id o5-20020a05600c510500b003cfca1a327fso9284573wms.8
        for <nbd@other.debian.org>; Wed, 30 Nov 2022 03:48:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ew+rmcqxH2n7lRVyzxgZ+S2EuF0zHGkt1auf+7rBZUw=;
        b=GOn6SZoocaOgTfM+2E5GmLYqkN/QyUNiVDFy8ymCsjxUWMerLW1IaRz7ozSRV2zBNM
         mwoZfwjvXyxsSDsSi0rM3o7oPHSI4mhqKrj+mODsMdZ6oy7anWlvbZdP6rhEr2brZoYw
         VBuIqN/2uHFn1jBWg487kfbkyGpGlBBMunEjitah3/ZnZSM8Hnm4O5XS9/Q/YePZiKFZ
         DyYB1tY3ylqgMxl5+qUzfP9EIScJHA/focNYrvInJgwnnJCHJsBc5J47YP/AW7FBUeFf
         Nv27fUnhO1Yu7MwZKLdRmN5CMuqD132NGpGCo/p2jJQsLIRvXalaJYx6mglQv5CsI6uP
         uauQ==
X-Gm-Message-State: ANoB5pn+1Np0sAKuQMLEzIG8PJn1wjJcU8rJvgmv40R7HQ0e7k2suO9Q
	Su9IAVA+hvgDrjiGOl13yiNAFAGCaMTf+ioUA565ZOvAk7dyyBxU+kjd8/QqhswQT5sBzJR2psy
	+WZhZ9spALBzZSw==
X-Received: by 2002:a5d:5f04:0:b0:241:e9a6:fb3 with SMTP id cl4-20020a5d5f04000000b00241e9a60fb3mr22408126wrb.462.1669808919575;
        Wed, 30 Nov 2022 03:48:39 -0800 (PST)
X-Google-Smtp-Source: AA0mqf71i1QvnhhrXaTwa+I+8EpX/qnDqrYR4GbrQTWzEGi7bUvVncNy/xc2a74B4erNgTJKDcQn3Q==
X-Received: by 2002:a5d:5f04:0:b0:241:e9a6:fb3 with SMTP id cl4-20020a5d5f04000000b00241e9a60fb3mr22408062wrb.462.1669808919318;
        Wed, 30 Nov 2022 03:48:39 -0800 (PST)
Received: from pc-4.home (2a01cb058918ce00dd1a5a4f9908f2d5.ipv6.abo.wanadoo.fr. [2a01:cb05:8918:ce00:dd1a:5a4f:9908:f2d5])
        by smtp.gmail.com with ESMTPSA id 16-20020a05600c22d000b003b497138093sm1620841wmg.47.2022.11.30.03.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 03:48:38 -0800 (PST)
Date: Wed, 30 Nov 2022 12:48:35 +0100
From: Guillaume Nault <gnault@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Benjamin Coddington <bcodding@redhat.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>,
	Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
	Lee Duncan <lduncan@suse.com>, Chris Leech <cleech@redhat.com>,
	Mike Christie <michael.christie@oracle.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Steve French <sfrench@samba.org>,
	Christine Caulfield <ccaulfie@redhat.com>,
	David Teigland <teigland@redhat.com>, Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Eric Van Hensbergen <ericvh@gmail.com>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Ilya Dryomov <idryomov@gmail.com>, Xiubo Li <xiubli@redhat.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna@kernel.org>,
	Chuck Lever <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>, drbd-dev@lists.linbit.com,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-nvme@lists.infradead.org, open-iscsi@googlegroups.com,
	linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org, cluster-devel@redhat.com,
	ocfs2-devel@oss.oracle.com, v9fs-developer@lists.sourceforge.net,
	ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org
Subject: Re: [PATCH v1 2/3] Treewide: Stop corrupting socket's task_frag
Message-ID: <20221130114835.GA29316@pc-4.home>
References: <cover.1669036433.git.bcodding@redhat.com>
 <c2ec184226acd21a191ccc1aa46a1d7e43ca7104.1669036433.git.bcodding@redhat.com>
 <20221129140242.GA15747@lst.de>
MIME-Version: 1.0
In-Reply-To: <20221129140242.GA15747@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <w5sID88iDNC.A.xVG.v70hjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2312
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20221130114835.GA29316@pc-4.home
Resent-Date: Wed, 30 Nov 2022 12:39:11 +0000 (UTC)

On Tue, Nov 29, 2022 at 03:02:42PM +0100, Christoph Hellwig wrote:
> Hmm.  Having to set a flag to not accidentally corrupt per-task
> state seems a bit fragile.  Wouldn't it make sense to find a way to opt
> into the feature only for sockets created from the syscall layer?

That's something I originally considered. But, as far as I can see, nbd
needs this flag _and_ uses sockets created in user space. So it'd still
need to opt out manually.

