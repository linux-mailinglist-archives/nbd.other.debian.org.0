Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F446AA4AC
	for <lists+nbd@lfdr.de>; Fri,  3 Mar 2023 23:41:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5D8F7208EC; Fri,  3 Mar 2023 22:41:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Mar  3 22:41:08 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 53B6D208C6
	for <lists-other-nbd@bendel.debian.org>; Fri,  3 Mar 2023 22:40:57 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.082 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id JVY5sjgGovQW for <lists-other-nbd@bendel.debian.org>;
	Fri,  3 Mar 2023 22:40:49 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id B7BE0208A1
	for <nbd@other.debian.org>; Fri,  3 Mar 2023 22:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677883244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YCs++0UsDn2I23tW4LFZnn2rnwrR0f+f/KvujfQTnE8=;
	b=eMd7c0iIUUjJccWz9B/gJXePe6OovM341xOMVUSiNKaMQnK4G5+dV8xMCxdMxpUSPng4ej
	tKdtsY+pdkyObyAAsZuUDGHuY/09UCUW6/R2xg49dT1SCe2YJYilF9raFXSzapBHior9pT
	U6+Dq1uUIDF3ypuSdf3Hfc4P9D7BzCk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-r9371hxYPgWLxpaUffrfkw-1; Fri, 03 Mar 2023 17:40:41 -0500
X-MC-Unique: r9371hxYPgWLxpaUffrfkw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A89D85A5A3;
	Fri,  3 Mar 2023 22:40:41 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.108])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B32F492C3E;
	Fri,  3 Mar 2023 22:40:40 +0000 (UTC)
Date: Fri, 3 Mar 2023 16:40:38 -0600
From: Eric Blake <eblake@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: nbd@other.debian.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
	libguestfs@redhat.com
Subject: Re: [PATCH v2 5/6] spec: Introduce NBD_FLAG_BLOCK_STATUS_PAYLOAD
Message-ID: <20230303224038.sxhd6enenp4v7gpa@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224655.2186173-1-eblake@redhat.com>
 <20221114224655.2186173-6-eblake@redhat.com>
 <Y/Xo+DGAYSZ4bQvK@pc220518.home.grep.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/Xo+DGAYSZ4bQvK@pc220518.home.grep.be>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <7R1PUcv9jCF.A.ECH.EenAkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2343
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230303224038.sxhd6enenp4v7gpa@redhat.com
Resent-Date: Fri,  3 Mar 2023 22:41:08 +0000 (UTC)

On Wed, Feb 22, 2023 at 12:05:44PM +0200, Wouter Verhelst wrote:
> On Mon, Nov 14, 2022 at 04:46:54PM -0600, Eric Blake wrote:
> >  #### Simple reply message
> > 
> > @@ -1232,6 +1235,19 @@ The field has the following format:
> >    will be faster than a regular write). Clients MUST NOT set the
> >    `NBD_CMD_FLAG_FAST_ZERO` request flag unless this transmission flag
> >    is set.
> > +- bit 12, `NBD_FLAG_BLOCK_STATUS_PAYLOAD`: Indicates that the server
> > +  understands the use of the `NBD_CMD_FLAG_PAYLOAD_LEN` flag to
> > +  `NBD_CMD_BLOCK_STATUS` to allow the client to request that the
> > +  server filters its response to a specific subset of negotiated
> > +  metacontext ids passed in via a client payload, rather than the
> > +  default of replying to all metacontext ids. Servers MUST NOT
> > +  advertise this bit unless the client successfully negotiates
> > +  extended headers via `NBD_OPT_EXTENDED_HEADERS`, and SHOULD NOT
> > +  advertise this bit in response to `NBD_OPT_EXPORT_NAME` or
> > +  `NBD_OPT_GO` if the client does not negotiate metacontexts with
> > +  `NBD_OPT_SET_META_CONTEXT`; clients SHOULD NOT set the
> > +  `NBD_CMD_FLAG_PAYLOAD_LEN` flag for `NBD_CMD_BLOCK_STATUS` unless
> > +  this transmission flag is set.
> 
> Given that we are introducing this at the same time as the extended
> headers (and given that we're running out of available flags in this
> 16-bit field), isn't it better to make the ability to understand
> PAYLOAD_LEN be implied by extended headers? Or is there a use case for
> implementing extended headers but not a payload length on
> CMD_BLOCK_STATUS that I'm missing?

In my proof of implementation, this was a distinct feature addition on
top of 64-bit headers.

It is easy to write a server that does not want to deal with a client
payload on a block status request (for example, a server that only
knows about one metacontext, and therefore never needs to deal with a
client wanting a subset of negotiated metacontexts).  Forcing a server
to have to support a client-side filtering request on block status
commands, merely because the server now supports 64-bit lengths,
seemed like a stretch too far, which is why I decided to use a feature
bit for this one.


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

