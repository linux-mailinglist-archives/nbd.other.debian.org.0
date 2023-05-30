Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 6839271654E
	for <lists+nbd@lfdr.de>; Tue, 30 May 2023 16:56:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 45CD520836; Tue, 30 May 2023 14:56:43 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue May 30 14:56:43 2023
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 511B1207C9
	for <lists-other-nbd@bendel.debian.org>; Tue, 30 May 2023 14:56:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.19 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id nL60BCQMXqCl for <lists-other-nbd@bendel.debian.org>;
	Tue, 30 May 2023 14:56:23 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 27F46207B8
	for <nbd@other.debian.org>; Tue, 30 May 2023 14:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=sSrR/sGq3sxPT0XfEJSKo8ylHUmEgfGa7MhUK/BQMw4=; b=Kk3ysyDaN2hAHPGlksr0dPFAfM
	drHFzStyRGuzypCVkDbcuHFePen5HF8Q6sogzMzdawBOeZ5n4N2AACJIS0NFjvzL3IorAljE6ftNn
	1LXTDZFaRquN5rhT+iZbDH7XGkJ8xBqrYHvk7E7toyR+FN/p/A8ZkhSBm5jlJYeAYLvLAvfIkxq5Q
	PvBSCWf61VkzT4iW4dAOOnz8O5+Uj394XAJJqlW50jpVILkrnTmvIMkYgnAMP3CDzNTxxsrQDsi26
	wTde0QIv6pB3TYP91lrDBXCkT+8EyORTTiC+4wrcFXi0SS6VGwkbUUyXKNlyqViFDaT27u55Xm83L
	axYyeF0Q==;
Received: from [196.251.239.242] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1q40le-00AdUR-6e; Tue, 30 May 2023 16:56:09 +0200
Received: from wouter by pc220518 with local (Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1q40lW-000dTN-0c;
	Tue, 30 May 2023 16:56:02 +0200
Date: Tue, 30 May 2023 16:56:01 +0200
From: Wouter Verhelst <w@uter.be>
To: Laszlo Ersek <lersek@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, libguestfs@redhat.com,
	qemu-block@nongnu.org, nbd@other.debian.org
Subject: Re: [Libguestfs] [libnbd PATCH v3 03/22] protocol: Add definitions
 for extended headers
Message-ID: <ZHYOgQAL3ELxr1S9@pc220518.home.grep.be>
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-4-eblake@redhat.com>
 <2b98a2ca-62d5-c87b-2a37-1a49af89b4b4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b98a2ca-62d5-c87b-2a37-1a49af89b4b4@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <1oy06FGjh3P.A.M7.r6gdkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2511
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZHYOgQAL3ELxr1S9@pc220518.home.grep.be
Resent-Date: Tue, 30 May 2023 14:56:43 +0000 (UTC)

On Tue, May 30, 2023 at 01:50:59PM +0200, Laszlo Ersek wrote:
> On 5/25/23 15:00, Eric Blake wrote:
> > Add the magic numbers and new structs necessary to implement the NBD
> > protocol extension of extended headers providing 64-bit lengths.  This
> > corresponds to upstream nbd commits 36abf47d and a9384e2f on the
> > extension-ext-header branch[1] (commit e6f3b94a for
> > NBD_FLAG_BLOCK_STATUS_PAYLOAD is saved for a later patch).
> > 
> > [1] https://github.com/NetworkBlockDevice/nbd/blob/extension-ext-header/doc/proto.md
> > 
> > Signed-off-by: Eric Blake <eblake@redhat.com>
> > ---
> >  lib/nbd-protocol.h | 66 ++++++++++++++++++++++++++++++++++++----------
> >  1 file changed, 52 insertions(+), 14 deletions(-)
> > 
> > diff --git a/lib/nbd-protocol.h b/lib/nbd-protocol.h
> > index f4640a98..b6fa9b8a 100644
> > --- a/lib/nbd-protocol.h
> > +++ b/lib/nbd-protocol.h
> > @@ -124,6 +124,7 @@ struct nbd_fixed_new_option_reply {
> >  #define NBD_OPT_STRUCTURED_REPLY   8
> >  #define NBD_OPT_LIST_META_CONTEXT  9
> >  #define NBD_OPT_SET_META_CONTEXT   10
> > +#define NBD_OPT_EXTENDED_HEADERS   11
> > 
> >  #define NBD_REP_ERR(val) (0x80000000 | (val))
> >  #define NBD_REP_IS_ERR(val) (!!((val) & 0x80000000))
> > @@ -141,6 +142,7 @@ struct nbd_fixed_new_option_reply {
> >  #define NBD_REP_ERR_SHUTDOWN         NBD_REP_ERR (7)
> >  #define NBD_REP_ERR_BLOCK_SIZE_REQD  NBD_REP_ERR (8)
> >  #define NBD_REP_ERR_TOO_BIG          NBD_REP_ERR (9)
> > +#define NBD_REP_ERR_EXT_HEADER_REQD  NBD_REP_ERR (10)
> > 
> >  #define NBD_INFO_EXPORT      0
> >  #define NBD_INFO_NAME        1
> > @@ -182,16 +184,26 @@ struct nbd_fixed_new_option_reply_meta_context {
> >    /* followed by a string */
> >  } NBD_ATTRIBUTE_PACKED;
> > 
> > -/* Request (client -> server). */
> > +/* Compact request (client -> server). */
> >  struct nbd_request {
> >    uint32_t magic;               /* NBD_REQUEST_MAGIC. */
> > -  uint16_t flags;               /* Request flags. */
> > -  uint16_t type;                /* Request type. */
> > +  uint16_t flags;               /* Request flags: NBD_CMD_FLAG_*. */
> > +  uint16_t type;                /* Request type: NBD_CMD_*. */
> >    uint64_t handle;              /* Opaque handle. */
> >    uint64_t offset;              /* Request offset. */
> >    uint32_t count;               /* Request length. */
> >  } NBD_ATTRIBUTE_PACKED;
> > 
> > +/* Extended request (client -> server). */
> > +struct nbd_request_ext {
> > +  uint32_t magic;               /* NBD_EXTENDED_REQUEST_MAGIC. */
> > +  uint16_t flags;               /* Request flags: NBD_CMD_FLAG_*. */
> > +  uint16_t type;                /* Request type: NBD_CMD_*. */
> > +  uint64_t handle;              /* Opaque handle. */
> > +  uint64_t offset;              /* Request offset. */
> > +  uint64_t count;               /* Request effect or payload length. */
> > +} NBD_ATTRIBUTE_PACKED;
> > +
> >  /* Simple reply (server -> client). */
> >  struct nbd_simple_reply {
> >    uint32_t magic;               /* NBD_SIMPLE_REPLY_MAGIC. */
> > @@ -208,6 +220,16 @@ struct nbd_structured_reply {
> >    uint32_t length;              /* Length of payload which follows. */
> >  } NBD_ATTRIBUTE_PACKED;
> > 
> > +/* Extended reply (server -> client). */
> > +struct nbd_extended_reply {
> > +  uint32_t magic;               /* NBD_EXTENDED_REPLY_MAGIC. */
> > +  uint16_t flags;               /* NBD_REPLY_FLAG_* */
> > +  uint16_t type;                /* NBD_REPLY_TYPE_* */
> > +  uint64_t handle;              /* Opaque handle. */
> > +  uint64_t offset;              /* Client's offset. */
> > +  uint64_t length;              /* Length of payload which follows. */
> > +} NBD_ATTRIBUTE_PACKED;
> > +
> >  struct nbd_structured_reply_offset_data {
> >    uint64_t offset;              /* offset */
> >    /* Followed by data. */
> > @@ -224,11 +246,23 @@ struct nbd_block_descriptor {
> >    uint32_t status_flags;        /* block type (hole etc) */
> >  } NBD_ATTRIBUTE_PACKED;
> > 
> > +/* NBD_REPLY_TYPE_BLOCK_STATUS_EXT block descriptor. */
> > +struct nbd_block_descriptor_ext {
> > +  uint64_t length;              /* length of block */
> > +  uint64_t status_flags;        /* block type (hole etc) */
> 
> I wonder if making the status_flags fields uint64_t too was really
> necessary, or just a consequence of us wanting to treat a sequence of
> these records as a (double as long) sequence of uint64_t's. Anyway, this
> is a spec-level question, and I totally don't want to question the spec. :)

The actual interpretation of the status flag is up to the spec of the
metadata namespace that is being used for this particular request.

Some metadata namespaces treat the "flags" field as an unsigned integer,
to specify offsets or counters. I that context, the flags field should
indeed be extended to 64 bits.

> > +} NBD_ATTRIBUTE_PACKED;
> > +
> >  struct nbd_structured_reply_block_status_hdr {
> >    uint32_t context_id;          /* metadata context ID */
> >    /* followed by array of nbd_block_descriptor extents */
> >  } NBD_ATTRIBUTE_PACKED;
> > 
> > +struct nbd_structured_reply_block_status_ext_hdr {
> > +  uint32_t context_id;          /* metadata context ID */
> > +  uint32_t count;               /* length of following array */
> 
> (1) I think that "length of following array" is confusing here. Per
> spec, this is "descriptor count" -- that's clearer. "Length" could be
> mistaken for "number of bytes".
> 
> Also, what was the justification for *not* making "count" uint64_t?
> (Just asking.) I do understand a server is permitted to respond with a
> block status reply that covers less than the requested range, so I
> understand a server, if it needs to, *can* truncate its response for the
> sake of fitting "count" into a uint32_t.

This is, as you say, the number of block descriptor messages we are
going to send to the client. Each such message is at 8 bytes long.

That would mean that by the time you overflow a uint32_t with the number
of extents that are to be sent, you'll be promising to send 2^32 * 8
(i.e., 2^36) bytes of data, or 32 GiB.

That would be a ridiculously amount of data, and no user is going to
wait for a client to finish parsing that amount of data without a hard
reboot of their client.

The only change that would be reasonable here is to reduce the size of
this field 16 to bits, rather than increasing it (but then we lose
alignment, so that's also not a good idea)

> > +  /* followed by array of nbd_block_descriptor_ext extents */
> > +} NBD_ATTRIBUTE_PACKED;
> > +
> >  struct nbd_structured_reply_error {
> >    uint32_t error;               /* NBD_E* error number */
> >    uint16_t len;                 /* Length of human readable error. */
> > @@ -236,8 +270,10 @@ struct nbd_structured_reply_error {
> >  } NBD_ATTRIBUTE_PACKED;
> > 
> >  #define NBD_REQUEST_MAGIC           0x25609513
> > +#define NBD_EXTENDED_REQUEST_MAGIC  0x21e41c71
> >  #define NBD_SIMPLE_REPLY_MAGIC      0x67446698
> >  #define NBD_STRUCTURED_REPLY_MAGIC  0x668e33ef
> > +#define NBD_EXTENDED_REPLY_MAGIC    0x6e8a278c
> > 
> >  /* Structured reply flags. */
> >  #define NBD_REPLY_FLAG_DONE         (1<<0)
> > @@ -246,12 +282,13 @@ struct nbd_structured_reply_error {
> >  #define NBD_REPLY_TYPE_IS_ERR(val) (!!((val) & (1<<15)))
> > 
> >  /* Structured reply types. */
> > -#define NBD_REPLY_TYPE_NONE         0
> > -#define NBD_REPLY_TYPE_OFFSET_DATA  1
> > -#define NBD_REPLY_TYPE_OFFSET_HOLE  2
> > -#define NBD_REPLY_TYPE_BLOCK_STATUS 5
> > -#define NBD_REPLY_TYPE_ERROR        NBD_REPLY_TYPE_ERR (1)
> > -#define NBD_REPLY_TYPE_ERROR_OFFSET NBD_REPLY_TYPE_ERR (2)
> > +#define NBD_REPLY_TYPE_NONE             0
> > +#define NBD_REPLY_TYPE_OFFSET_DATA      1
> > +#define NBD_REPLY_TYPE_OFFSET_HOLE      2
> > +#define NBD_REPLY_TYPE_BLOCK_STATUS     5
> > +#define NBD_REPLY_TYPE_BLOCK_STATUS_EXT 6
> > +#define NBD_REPLY_TYPE_ERROR            NBD_REPLY_TYPE_ERR (1)
> > +#define NBD_REPLY_TYPE_ERROR_OFFSET     NBD_REPLY_TYPE_ERR (2)
> > 
> >  /* NBD commands. */
> >  #define NBD_CMD_READ              0
> > @@ -263,11 +300,12 @@ struct nbd_structured_reply_error {
> >  #define NBD_CMD_WRITE_ZEROES      6
> >  #define NBD_CMD_BLOCK_STATUS      7
> > 
> > -#define NBD_CMD_FLAG_FUA       (1<<0)
> > -#define NBD_CMD_FLAG_NO_HOLE   (1<<1)
> > -#define NBD_CMD_FLAG_DF        (1<<2)
> > -#define NBD_CMD_FLAG_REQ_ONE   (1<<3)
> > -#define NBD_CMD_FLAG_FAST_ZERO (1<<4)
> > +#define NBD_CMD_FLAG_FUA         (1<<0)
> > +#define NBD_CMD_FLAG_NO_HOLE     (1<<1)
> > +#define NBD_CMD_FLAG_DF          (1<<2)
> > +#define NBD_CMD_FLAG_REQ_ONE     (1<<3)
> > +#define NBD_CMD_FLAG_FAST_ZERO   (1<<4)
> > +#define NBD_CMD_FLAG_PAYLOAD_LEN (1<<5)
> 
> Ah, this seems like a nice addition: "... the client sets
> NBD_CMD_FLAG_PAYLOAD_LEN in order to pass a payload that informs the
> server to limit its replies to the metacontext id(s) in the client's
> request payload, rather than giving an answer on all possible
> metacontext ids".
> 
> > 
> >  /* NBD error codes. */
> >  #define NBD_SUCCESS     0
> 
> With (1) clarified:
> 
> Reviewed-by: Laszlo Ersek <lersek@redhat.com>
> 
> 

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

