Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id D13F97280BD
	for <lists+nbd@lfdr.de>; Thu,  8 Jun 2023 14:59:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 54011204AB; Thu,  8 Jun 2023 12:59:48 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun  8 12:59:48 2023
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id AC17B204A0
	for <lists-other-nbd@bendel.debian.org>; Thu,  8 Jun 2023 12:59:37 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.191 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id GR6gtb291N6S for <lists-other-nbd@bendel.debian.org>;
	Thu,  8 Jun 2023 12:59:30 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 132402049C
	for <nbd@other.debian.org>; Thu,  8 Jun 2023 12:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686229165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ipVVd+zl3HCHoB5wbxchrNSckn1UglcBH8rjGKicrXQ=;
	b=UzJmj/2UZpiuQOddFpF5UbwlIgmRQqdbH3OkK4YZmSO/U94Jx86Q9sxkFA0kONytsVZRnK
	DxBDVBq7hmiKB05NyViRogcKZ4+dWvmVDrczfszgGxj5FC7vFEPliIBS8D/r5pjzu9BV1F
	BB5ZqhIQWi3G7NOI/78BDMIoEXWcDHA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-GSiFCJd4Ndy2TfLqJo8dpw-1; Thu, 08 Jun 2023 08:58:13 -0400
X-MC-Unique: GSiFCJd4Ndy2TfLqJo8dpw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 105288582A4;
	Thu,  8 Jun 2023 12:58:13 +0000 (UTC)
Received: from localhost (unknown [10.39.192.206])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ACD73140E955;
	Thu,  8 Jun 2023 12:58:12 +0000 (UTC)
Date: Thu, 8 Jun 2023 13:58:12 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: libguestfs@redhat.com, qemu-block@nongnu.org, nbd@other.debian.org
Subject: Re: [libnbd PATCH v3 17/22] ocaml: Add example for 64-bit extents
Message-ID: <20230608125812.GI7912@redhat.com>
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-18-eblake@redhat.com>
 <20230608093759.GN7773@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230608093759.GN7773@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <IAQhMO9LA6G.A.Z6B.EDdgkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2547
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230608125812.GI7912@redhat.com
Resent-Date: Thu,  8 Jun 2023 12:59:48 +0000 (UTC)

On Thu, Jun 08, 2023 at 10:37:59AM +0100, Richard W.M. Jones wrote:
> Yes, the API is nicer now we return the subelements as a list instead
> of having to iterate over the list in pairs.  I might change that to
> an array or struct after these patches go upstream as that will be a
> tiny bit more efficient.

Actually the second sentence here is wrong.  It's allocated as a pair
not a list, and a pair has the same internal representation as a
2-element array.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
Fedora Windows cross-compiler. Compile Windows programs, test, and
build Windows installers. Over 100 libraries supported.
http://fedoraproject.org/wiki/MinGW

