Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 982B06BA5CA
	for <lists+nbd@lfdr.de>; Wed, 15 Mar 2023 04:51:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6018320530; Wed, 15 Mar 2023 03:51:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar 15 03:51:12 2023
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2 autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6CDFA20527
	for <lists-other-nbd@bendel.debian.org>; Wed, 15 Mar 2023 03:34:04 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.818 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1,
	DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id X9dAkBZwfMoH for <lists-other-nbd@bendel.debian.org>;
	Wed, 15 Mar 2023 03:33:56 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 24CFF20530
	for <nbd@other.debian.org>; Wed, 15 Mar 2023 03:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678851230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P8AT5dPnPUO+JypixZa88t/Pmtrax3iyp7vcDArwYms=;
	b=AWzriW/dvDNz0t4GiM4C+TfczO8oY4pNVVIqFFl9VNaGjrk6ElS9Qzx2CyNlVJrgelJjfG
	BjMmxCE3MozC8E6GasqIhKbhdjgtTcPvhpYVUIyGpG1OgewdLmWnqEBvxOvzIzSrAVSroc
	e0CeVdSd12GZmFKO6vq0CLZgrQpx26o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-XmQ9F8K2Pk-Z_PtwFA-QGw-1; Tue, 14 Mar 2023 23:33:45 -0400
X-MC-Unique: XmQ9F8K2Pk-Z_PtwFA-QGw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99C1D1C0418B;
	Wed, 15 Mar 2023 03:33:44 +0000 (UTC)
Received: from ovpn-8-22.pek2.redhat.com (ovpn-8-22.pek2.redhat.com [10.72.8.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B22940B3ED6;
	Wed, 15 Mar 2023 03:33:37 +0000 (UTC)
Date: Wed, 15 Mar 2023 11:33:32 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: Nir Soffer <nsoffer@redhat.com>, josef@toxicpanda.com,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
	christoph.boehmwalder@linbit.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	ming.lei@redhat.com
Subject: Re: [PATCH 2/3] uapi nbd: add cookie alias to handle
Message-ID: <ZBE8jPO5RomMUTmG@ovpn-8-22.pek2.redhat.com>
References: <20230310201525.2615385-1-eblake@redhat.com>
 <20230310201525.2615385-3-eblake@redhat.com>
 <CAMRbyysDE+v_D6Q3tCf_+86T0V57UE4Emw6zc_4vnUu0Yau23A@mail.gmail.com>
 <20230314195023.bsey5bfq2atz7d66@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230314195023.bsey5bfq2atz7d66@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <YqUryjNP_N.A.tV.wCUEkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2394
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZBE8jPO5RomMUTmG@ovpn-8-22.pek2.redhat.com
Resent-Date: Wed, 15 Mar 2023 03:51:12 +0000 (UTC)

On Tue, Mar 14, 2023 at 02:50:23PM -0500, Eric Blake wrote:
> On Sat, Mar 11, 2023 at 02:30:39PM +0200, Nir Soffer wrote:
> > On Fri, Mar 10, 2023 at 10:16 PM Eric Blake <eblake@redhat.com> wrote:
> > >
> > > The uapi <linux/nbd.h> header declares a 'char handle[8]' per request;
> > > which is overloaded in English (are you referring to "handle" the
> > > verb, such as handling a signal or writing a callback handler, or
> > > "handle" the noun, the value used in a lookup table to correlate a
> > > response back to the request).  Many client-side NBD implementations
> > > (both servers and clients) have instead used 'u64 cookie' or similar,
> > > as it is easier to directly assign an integer than to futz around with
> > > memcpy.  In fact, upstream documentation is now encouraging this shift
> > > in terminology: https://lists.debian.org/nbd/2023/03/msg00031.html
> > >
> > > Accomplish this by use of an anonymous union to provide the alias for
> > > anyone getting the definition from the uapi; this does not break
> > > existing clients, while exposing the nicer name for those who prefer
> > > it.  Note that block/nbd.c still uses the term handle (in fact, it
> > > actually combines a 32-bit cookie and a 32-bit tag into the 64-bit
> > > handle), but that internal usage is not changed the public uapi, since
> > > no compliant NBD server has any reason to inspect or alter the 64
> > > bits sent over the socket.
> > >
> > > Signed-off-by: Eric Blake <eblake@redhat.com>
> > > ---
> > >  include/uapi/linux/nbd.h | 10 ++++++++--
> > >  1 file changed, 8 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/include/uapi/linux/nbd.h b/include/uapi/linux/nbd.h
> > > index 8797387caaf7..f58f2043f62e 100644
> > > --- a/include/uapi/linux/nbd.h
> > > +++ b/include/uapi/linux/nbd.h
> > > @@ -81,7 +81,10 @@ enum {
> > >  struct nbd_request {
> > >         __be32 magic;   /* NBD_REQUEST_MAGIC    */
> > >         __be32 type;    /* See NBD_CMD_*        */
> > > -       char handle[8];
> > > +       union {
> > > +               char handle[8];
> > > +               __be64 cookie;
> > > +       };
> > >         __be64 from;
> > >         __be32 len;
> > >  } __attribute__((packed));
> > > @@ -93,6 +96,9 @@ struct nbd_request {
> > >  struct nbd_reply {
> > >         __be32 magic;           /* NBD_REPLY_MAGIC      */
> > >         __be32 error;           /* 0 = ok, else error   */
> > > -       char handle[8];         /* handle you got from request  */
> > > +       union {
> > > +               char handle[8]; /* handle you got from request  */
> > > +               __be64 cookie;
> > 
> > Should we document like this?
> > 
> >     union {
> >         __be64 cookie; /* cookie you got from request */
> >         char handle[8]; /* older name */
> > 
> > I think we want future code to use the new term.
> 
> Sure, swapping the order to favor the preferred name first makes sense.
> 
> I'm still not sure on whether cookie should be u64 or __be64 (it's
> opaque, so endianness over the wire doesn't matter;

I guess it is 'u64', given ->handle is always copied to nbd_reply from
nbd_request in nbd server side, so native endian is always applied for
building and parsing ->handle in nbd client side.

But it looks odd to mark it as u64.

> and previous code
> was using memcpy() onto char[8] which may behave differently depending
> on machine endianness).




Thanks,
Ming

