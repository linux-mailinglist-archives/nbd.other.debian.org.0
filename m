Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BACC8C7448
	for <lists+nbd@lfdr.de>; Thu, 16 May 2024 12:01:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5A84620635; Thu, 16 May 2024 10:01:33 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu May 16 10:01:33 2024
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 48C812057E
	for <lists-other-nbd@bendel.debian.org>; Thu, 16 May 2024 10:01:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.428 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-1.23, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id xaQv3X6bt4o7 for <lists-other-nbd@bendel.debian.org>;
	Thu, 16 May 2024 10:01:14 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
X-Greylist: delayed 308 seconds by postgrey-1.36 at bendel; Thu, 16 May 2024 10:01:14 UTC
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 5D0D120579
	for <nbd@other.debian.org>; Thu, 16 May 2024 10:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715853669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ABOc1hs8Z7nyTNJJ3K7PD0sVxk4rMYndFmYIfafhzQI=;
	b=CdUHe3at3q8tjnfJR9Ed5RtJLKLsNWFbgvB4aHsJZf03PGs4/NdIJAUJGb9+IHaOXA3ujS
	zCRT0xl+EsOc0Z9ryCURESIAZ2PB9S6Kxn88dp71CCLmCScwKK4Qq7h4a/ul/gjwC97N6U
	opU2iGdC8pyTc3URTBQEye7mvuSEIfE=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-18-BPwRWskKOLycY_SixRTfHA-1; Thu,
 16 May 2024 05:54:12 -0400
X-MC-Unique: BPwRWskKOLycY_SixRTfHA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A492E3806706;
	Thu, 16 May 2024 09:54:12 +0000 (UTC)
Received: from localhost (unknown [10.42.28.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 461825ADC41;
	Thu, 16 May 2024 09:54:12 +0000 (UTC)
Date: Thu, 16 May 2024 10:54:11 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: Eric Blake <eblake@redhat.com>, nbd@other.debian.org,
	guestfs@lists.libguestfs.org
Subject: Re: [Libguestfs] Re: what size should NBD_OPT_INFO report?
Message-ID: <20240516095411.GA28819@redhat.com>
References: <wqpfuwaznckk7ejagsjwdjvnjlslbspcsqrttcgjmqpumu5q6d@2tlrhbggnzj6>
 <paxaxd3fxa2nhbp2ldllolydeibtv7dsonti67cxvuz27hmtcf@6is65mo7ar3y>
 <fuy47nk42oe5jffsojcfykpdik7ld4mlp7gdwi52siopozwqa6@r7fhrfoljbs7>
 <ZkRveqZCVu24Z6jP@pc220518.home.grep.be>
MIME-Version: 1.0
In-Reply-To: <ZkRveqZCVu24Z6jP@pc220518.home.grep.be>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Y-gH92_0E9N.A.Y0H.9ldRmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2811
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240516095411.GA28819@redhat.com
Resent-Date: Thu, 16 May 2024 10:01:33 +0000 (UTC)


Y'all might be interested in this code I recently copied from
util-linux (originally "public domain") into nbdkit (BSD):

https://gitlab.com/nbdkit/nbdkit/-/blob/master/common/utils/device-size.c?ref_type=heads

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top

